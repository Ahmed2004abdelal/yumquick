#!/usr/bin/env python3
"""Fetch Pexels image URLs via Tavily API directly (no tavily tool).

Equivalent curl:
  curl -s https://api.tavily.com/search \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TAVILY_API_KEY" \
    -d '{"query": "<name> site:pexels.com", "include_images": true,
          "include_image_descriptions": true, "max_results": 5}'

Rules implemented:
 1. Read products.json (135). Strip accents (Rose/Pina).
 2. Accept only host images.pexels.com. Prefer description matching product name.
 3. Retry with "<name> food dish site:pexels.com" if no good result.
 4. HEAD-verify each URL: 200 + content-type image/*.
 5. Same-name ids share one image; different names never share a URL.
 6. Sleep 1s between calls. Save preview.json after every product (resume).
 7. Print table at end. Never modifies products.json. No backend calls.
"""
import json
import os
import sys
import time
import unicodedata
import urllib.request
import urllib.parse
import urllib.error

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
PRODUCTS_PATH = os.path.join(BASE_DIR, "products.json")
PREVIEW_PATH = os.path.join(BASE_DIR, "preview.json")
TAVILY_URL = "https://api.tavily.com/search"


def strip_accents(s: str) -> str:
    return "".join(
        c for c in unicodedata.normalize("NFKD", s) if not unicodedata.combining(c)
    )


def tavily_search(query: str, api_key: str, max_results: int = 5, timeout: int = 30):
    """Direct POST to Tavily API (curl-equivalent). Returns list of {url,title,description}."""
    payload = json.dumps(
        {
            "query": query,
            "include_images": True,
            "include_image_descriptions": True,
            "max_results": max_results,
        }
    ).encode("utf-8")
    req = urllib.request.Request(
        TAVILY_URL,
        data=payload,
        headers={
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json",
        },
        method="POST",
    )
    with urllib.request.urlopen(req, timeout=timeout) as resp:
        body = resp.read().decode("utf-8", errors="replace")
    data = json.loads(body)
    images = data.get("images", [])
    # Tavily may return images as strings (no descriptions) or dicts.
    norm = []
    for im in images:
        if isinstance(im, str):
            norm.append({"url": im, "title": "", "description": ""})
        elif isinstance(im, dict):
            norm.append(
                {
                    "url": im.get("url", ""),
                    "title": im.get("title", "") or "",
                    "description": im.get("description", "") or "",
                }
            )
    return norm


def is_pexels_image(url: str) -> bool:
    try:
        host = urllib.parse.urlparse(url).hostname or ""
        return host.lower() == "images.pexels.com"
    except Exception:
        return False


def head_verify(url: str, timeout: int = 15) -> bool:
    """HEAD request: require 200 and content-type image/*."""
    try:
        req = urllib.request.Request(url, method="HEAD", headers={"User-Agent": "Mozilla/5.0"})
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            status = resp.status
            ctype = resp.headers.get("Content-Type", "")
            return status == 200 and ctype.lower().startswith("image/")
    except urllib.error.HTTPError as e:
        return False
    except Exception as e:
        print(f"    HEAD failed for {url[:80]}: {e}")
        return False


def match_score(product_name: str, title: str, description: str) -> int:
    """Score = number of product-name tokens found in title+description."""
    clean = strip_accents(product_name).lower()
    tokens = [t.strip(".,!?'\"()") for t in clean.split()]
    tokens = [t for t in tokens if t]
    hay = strip_accents((title + " " + description).lower())
    return sum(1 for t in tokens if t in hay)


def pick_image(product_name, candidates, used_urls, norm_name):
    """Filter host, dedupe, sort by description match, HEAD-verify. Returns (url, desc) or (None, None)."""
    # Filter host + dedupe against different names
    filtered = []
    for c in candidates:
        url = c["url"]
        if not url or not is_pexels_image(url):
            continue
        owner = used_urls.get(url)
        if owner is not None and owner != norm_name:
            continue  # different name already uses this URL
        score = match_score(product_name, c["title"], c["description"])
        filtered.append((score, c))
    # Prefer description match (higher score first)
    filtered.sort(key=lambda x: x[0], reverse=True)
    for score, c in filtered:
        url = c["url"]
        desc = c["description"] or c["title"] or ""
        if head_verify(url):
            return url, desc, score
        else:
            print(f"    rejected (HEAD fail): {url[:100]}")
    return None, None, -1


def main():
    api_key = os.environ.get("TAVILY_API_KEY", "")
    if not api_key:
        print("ERROR: $TAVILY_API_KEY is not set.", file=sys.stderr)
        sys.exit(1)

    with open(PRODUCTS_PATH, encoding="utf-8") as f:
        products = json.load(f)
    print(f"Loaded {len(products)} products from products.json")
    products.sort(key=lambda p: p["id"])

    # Load resume state
    done = {}  # id -> entry
    if os.path.exists(PREVIEW_PATH):
        try:
            with open(PREVIEW_PATH, encoding="utf-8") as f:
                existing = json.load(f)
            for e in existing:
                if "id" in e and "imageUrl" in e:
                    if "description" not in e:
                        e["description"] = ""
                    if "name" not in e:
                        e["name"] = ""
                    done[e["id"]] = e
            print(f"Resuming: {len(done)} already done from preview.json")
        except Exception as e:
            print(f"WARN: could not read preview.json: {e}")

    # Build name -> result and used_urls from done state
    name_to_result = {}  # normalized clean name -> (url, desc)
    used_urls = {}  # url -> norm_name
    for eid, e in done.items():
        url = e.get("imageUrl", "")
        nm = strip_accents(e.get("name", "")).lower().strip()
        if url:
            if nm not in name_to_result:
                name_to_result[nm] = (url, e.get("description", ""))
            used_urls.setdefault(url, nm)

    def save():
        out = [done[k] for k in sorted(done)]
        tmp = PREVIEW_PATH + ".tmp"
        with open(tmp, "w", encoding="utf-8") as f:
            json.dump(out, f, ensure_ascii=False, indent=2)
        os.replace(tmp, PREVIEW_PATH)

    try:
        for p in products:
            pid = p["id"]
            pname = p["name"]
            if pid in done and done[pid].get("imageUrl"):
                # Ensure shared-name maps are populated for resume
                nm = strip_accents(pname).lower().strip()
                if nm not in name_to_result:
                    name_to_result[nm] = (done[pid]["imageUrl"], done[pid].get("description", ""))
                used_urls.setdefault(done[pid]["imageUrl"], nm)
                continue

            clean = strip_accents(pname)
            norm_name = clean.lower().strip()

            # Rule 5: same name shares one image — reuse without API call
            if norm_name in name_to_result:
                url, desc = name_to_result[norm_name]
                done[pid] = {"id": pid, "name": pname, "imageUrl": url, "description": desc}
                save()
                print(f"[{pid}/135] {pname} -> shared with same name (no API call)")
                continue

            url, desc = None, ""
            queries = [f"{clean} site:pexels.com", f"{clean} food dish site:pexels.com"]
            for qi, q in enumerate(queries):
                label = "primary" if qi == 0 else "retry"
                print(f"[{pid}/135] {pname} | {label} query: {q}")
                try:
                    candidates = tavily_search(q, api_key)
                except Exception as e:
                    print(f"    Tavily error: {e}")
                    candidates = []
                print(f"    got {len(candidates)} image candidates")
                u, d, score = pick_image(pname, candidates, used_urls, norm_name)
                if u:
                    url, desc = u, d
                    print(f"    SELECT (score={score}): {url[:110]}")
                    break
                else:
                    print(f"    no good result for {label} query.")
                if qi == 0:
                    time.sleep(1)  # sleep between the two calls too
            if not url:
                print(f"    WARNING: no verified Pexels image for id={pid} {pname}; leaving empty")
                url, desc = "", ""

            done[pid] = {"id": pid, "name": pname, "imageUrl": url, "description": desc}
            if url:
                name_to_result[norm_name] = (url, desc)
                used_urls.setdefault(url, norm_name)
            save()
            time.sleep(1)  # Rule 6: sleep 1s between calls
    except KeyboardInterrupt:
        print("\nInterrupted — progress saved to preview.json")
        save()
        sys.exit(130)

    # Rule 7: print table of all 135
    print("\n" + "=" * 100)
    print(f"{'ID':>4}  {'NAME':<28}  {'IMAGE URL'}")
    print("=" * 100)
    for p in products:
        e = done.get(p["id"], {})
        print(f"{p['id']:>4}  {p['name']:<28}  {e.get('imageUrl','')}")
        if e.get("description"):
            print(f"      desc: {e['description'][:120]}")
    print("=" * 100)
    ok = sum(1 for p in products if done.get(p["id"], {}).get("imageUrl"))
    print(f"Done: {ok}/{len(products)} have image URLs. Saved to {PREVIEW_PATH}")


if __name__ == "__main__":
    main()
