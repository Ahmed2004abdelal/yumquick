# AGENTS.md — YumQuick Project-Specific Architecture

This document contains **only YumQuick-specific details** that supplement the generic architecture in `~/.config/opencode/AGENTS.md`. Read the generic file first for templates, conventions, and scaffolding steps.

---

## 1. Project-Specific Stack Additions

These packages are **added on top of** the generic stack for YumQuick:

```yaml
dependencies:
  # Payments
  flutter_stripe: ^14.1.0
  # Auth
  google_sign_in: ^7.2.0
  # Chat
  chat_bubbles: ^1.10.1
  http: ^1.6.0
  intl: ^0.20.3
```

---

## 2. YumQuick Feature List (Exact Folder Names)

```
lib/features/
├── auth/
│   ├── login/
│   ├── signup/
│   └── repos/
├── onboarding/
├── home/
│   ├── data/
│   ├── logic/
│   │   ├── home/
│   │   └── product details/
│   └── ui/
├── favorites/
├── cart/
├── checkout/
├── my-orders/
├── help/
└── side menu screens/   # Note: space in folder name (legacy)
```

---

## 3. Project-Specific Models (Data Layer)

### Auth Models
- `login_request_model.dart`, `login_response_model.dart`, `google_login_request_model.dart`
- `signup_response_model.dart`

### Home Models
- `products_model.dart`, `categories_model.dart`, `banners_model.dart`
- `toppings_model.dart`, `products_response_model.dart`
- `add_to_cart_model.dart`, `product_favorite_model.dart`, `appbar_icons_model.dart`

### Cart Models
- `get_cart_model.dart`, `cart_action_models.dart`

### Checkout Models (nested in `checkout models/`)
- `checkout_request.dart`, `checkout_response.dart`, `checkout_screen_model.dart`

### My Orders Models
- `get_orders_model.dart`, `create_issue_model.dart`, `create_issue_response_model.dart`
- `complete_order_model.dart`, `cancel_order_text_model.dart`
- `review_item_model.dart`, `review_request_model.dart`

### Help Models
- `support_issues_model.dart`, `help_categories_model.dart`, `issue_messages_model.dart`
  - `issue_messages_model.freezed.dart` (uses freezed for nested structure)

### Side Menu Screens Models
- **Address**: `get_address_response.dart`, `add_address_request.dart`, `add_address_response.dart`
- **Payment**: `saved_card_model.dart`, `save_payment_method_request.dart`

### Core Shared Models
- `default_request.dart`, `default_response.dart` (generic DTOs)
- `bottom_nav_bar_model.dart`, `side_menu_model.dart`

---

## 4. Project-Specific Repositories

| Feature | Repository |
|---------|------------|
| Auth | `auth_repos.dart` |
| Home | `home_repo.dart`, `product_repo.dart` |
| Favorites | `favorites_repo.dart` |
| Cart | `cart_repo.dart` |
| Checkout | `checkout_repo.dart` |
| My Orders | `order_repo.dart` |
| Help | `help_repo.dart` |
| Side Menu - Address | `address_repo.dart` |
| Side Menu - Payment | `payment_repo.dart` |

---

## 5. Project-Specific Cubits & States

| Feature | Cubit | State File | Status Enum |
|---------|-------|------------|-------------|
| Auth Login | `login_cubit.dart` | `login_state.dart` | Sealed-class (`loginInitial`/`loading`/`success`/`error`) |
| Auth Signup | `signup_cubit.dart` | `signup_state.dart` | (check file) |
| Home | `home_cubit.dart` | `home_state.dart` | `HomeStatus` |
| Product Details | `product_details_cubit.dart` | `product_details_state.dart` | `ProductDetailsStatus` |
| Favorites | `favorites_cubit.dart` | `favorites_state.dart` | `FavoritesStatus` |
| Cart | `cart_cubit.dart` | `cart_state.dart` | `CartStatus` |
| Checkout | `checkout_cubit.dart` | `checkout_state.dart` | `CheckoutStatus` + `PaymentType` enum |
| My Orders | `orders_cubit.dart` | `orders_state.dart` | `OrdersStatus` + `visibleOrders` getter |
| Help | `help_cubit.dart` | `help_state.dart` | `HelpStatus` |
| Side Menu - Address | `address_cubit.dart` | `address_state.dart` | (check file) |
| Side Menu - Payment | `payment_cubit.dart` | `payment_state.dart` | (check file) |

**Notes**:
- `login_state.dart` uses sealed-class freezed pattern (not enum-based)
- `orders_state.dart` has a `visibleOrders` getter for tab filtering
- `checkout_state.dart` has `PaymentType { cash, card }` enum

---

## 6. Project-Specific UI Screens

| Feature | Screens |
|---------|---------|
| Auth | `login_screen.dart`, `signup_screen.dart`, `forgot_password_screen.dart` |
| Onboarding | `onboarding_screen.dart` |
| Home | `home_screen.dart`, `product_details_screen.dart` |
| Favorites | `favorites_screen.dart` |
| Cart | `cart_screen.dart` |
| Checkout | `checkout_screen.dart`, `order_payment_screen.dart`, `order_confirmed_screen.dart` |
| My Orders | `my_oreders_screen.dart`, `cancel_order_screen.dart`, `add_review_screen.dart` |
| Help | `help_center_screen.dart`, `helper_screen.dart`, `support_screen.dart`, `issue_chat_screen.dart` |
| Side Menu - Address | `address_screen.dart`, `add_new_address_screen.dart` |
| Side Menu - Payment | `payment_methods_screen.dart`, `add_card_screen.dart` |

**Widgets** (in `ui/widgets/`):
- Home: `home_app_bar.dart`, `home_content.dart`, `banners_section.dart`, `categories_section.dart`, `products_section.dart`, `best_seller.dart`, `recommend_section.dart`, `sidebar_menu.dart`
- My Orders: `create_order_issue_dialog.dart`

---

## 7. Routing (YumQuick-Specific Routes)

```dart
// core/Routing/routes.dart
class Routes {
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String forgotPassword = 'forgotPassword';
  static const String signup = 'signup';
  static const String bottomNavBar = 'bottomNavBar';
  static const String home = 'home';
  static const String productDetails = 'productDetails';
  static const String cart = 'cart';
  static const String checkout = 'checkout';
  static const String orderPayment = 'orderPayment';
  static const String addressScreen = 'addressScreen';
  static const String paymentMethodsScreen = 'paymentMethodsScreen';
  static const String addNewAddressScreen = 'addNewAddressScreen';
  static const String addCardScreen = 'addCardScreen';
  static const String orderConfirmedScreen = 'orderConfirmedScreen';
  static const String cancelOrderScreen = 'cancelOrderScreen';
  static const String addReviewScreen = 'addReviewScreen';
  static const String helpCenterScreen = 'helpCenterScreen';
  static const String supportScreen = 'supportScreen';
  static const String issueChatScreen = 'issueChatScreen';
}
```

**AppRouting wiring** (`core/Routing/app_routing.dart`):
- Wraps each screen in `BlocProvider` with cubit from GetIt
- Passes arguments via `settings.arguments` (typed checks)
- Examples: `Routes.productDetails` expects `ProductsModel` argument; `Routes.addNewAddressScreen` expects `AddressCubit` argument; `Routes.checkout` expects `CheckoutScreenModel`

---

## 8. Dependency Injection (YumQuick Registrations)

```dart
// core/di/dependency_injection.dart - key registrations
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<StripePaymentService>(() => StripePaymentService());

  // Auth
  getIt.registerLazySingleton<AuthRepos>(() => AuthRepos(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));

  // Favorites
  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(getIt()));

  // Cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  // Checkout
  getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(getIt()));
  // getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit(getIt(), getIt()));

  // Address
  getIt.registerLazySingleton<AddressRepo>(() => AddressRepo(getIt()));
  getIt.registerFactory<AddressCubit>(() => AddressCubit(getIt()));

  // Payment
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt(), getIt()));
  getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt()));

  // Orders
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt()));

  // Help
  getIt.registerLazySingleton<HelpRepo>(() => HelpRepo(getIt()));
}
```

---

## 9. Theme (YumQuick-Specific)

### AppColors (`core/theme/app_colors.dart`)
```dart
class AppColors {
  static const Color yellowBase = Color(0xFFF5CB58);
  static const Color yellowTwo = Color(0xFFF3E9B5);
  static const Color orangeBase = Color(0xFFE95322);
  static const Color orangeTwo = Color(0xFFFFDECF);
  static const Color font = Color(0xFF391713);
  static const Color fontTwo = Color(0xFFF8F8F8);
}
```

### AppTextStyle (`core/theme/app_text_style.dart`)
- Uses `GoogleFonts.leagueSpartan` as primary
- Uses `GoogleFonts.inter` for specific weights (Black)
- Pattern: `font<Size><Color><Weight>` (e.g., `font24OrangeBaseBlack`, `font16WhiteRegular`)
- ~50+ presets defined

### FontWeightHelper (`core/theme/font_weight_helper.dart`)
Standard weights: light, regular, medium, semiBold, bold, black

---

## 10. Helpers (YumQuick-Specific)

| File | Purpose |
|------|---------|
| `shared_pref_helper.dart` | Secure storage wrapper using `flutter_secure_storage` |
| `stripe_amount_helper.dart` | Amount conversion for Stripe (cents ↔ currency) |
| `constants.dart` | `isLoggedInUser` flag + `SharedPrefKeys` (userToken, addresses, cards) |
| `extensions.dart` | `BuildContext` nav helpers + `String?`/`List?` `.isNullOrEmpty()` |
| `helpers_functions.dart` | Misc formatters |

---

## 11. BottomNavBar (Root Scaffold)

`lib/bottom_nav_bar.dart`:
- `StatefulWidget` with `IndexedStack` (4 tabs)
- Tabs: Home, Favorites, Orders, Help
- Each tab wrapped in `BlocProvider` with cubit from GetIt
- Animated pill-style nav bar with SVG icons
- Auto-hide on scroll down

---

## 12. Main Entry (YumQuick-Specific)

```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  await checkIfLoggedInUser();
  Stripe.publishableKey = Env.stripePublishableKey;
  await Stripe.instance.applySettings();
  await GoogleSignIn.instance.initialize(serverClientId: Env.serverClientId);
  runApp(const MyApp());
}
```

- Initializes Stripe + Google Sign-In
- Reads token from secure storage to set `isLoggedInUser`
- `ScreenUtilInit` with design size `393x852` (iPhone baseline)

---

## 13. Code Generation Notes

- All models use `@JsonSerializable()` + `.g.dart`
- All states use `@freezed` + `.freezed.dart`
- `api_service.dart` uses `@RestApi()` + `.g.dart` (Retrofit)
- Run: `flutter pub run build_runner build --delete-conflicting-outputs`

---

## 14. YumQuick-Specific Conventions

| Convention | Detail |
|------------|--------|
| **Design size** | `Size(393, 852)` in `ScreenUtilInit` |
| **Primary font** | `GoogleFonts.leagueSpartan` |
| **Secondary font** | `GoogleFonts.inter` (for Black weight) |
| **Bottom nav** | 4 tabs, animated pill, SVG icons, auto-hide on scroll |
| **Stripe** | `StripePaymentService` wrapper; `CheckoutCubit` handles payment flow |
| **Google Sign-In** | Initialized in `main.dart` with `serverClientId` from Env |
| **Secure storage** | `flutter_secure_storage` via `SharedPrefHelper` |
| **Side menu screens** | Folder name has space (`side menu screens`) — legacy |
| **Issue messages** | Uses freezed for nested model (`issue_messages_model.freezed.dart`) |

---

## 15. Known YumQuick Gaps / TODOs

- [ ] **Testing** — No integration/widget tests visible
- [ ] **Localization** — `intl` added but no `.arb` files or `AppLocalizations`
- [ ] **Error UI** — Raw error text in some screens; need shared `ErrorWidget`
- [ ] **Image caching** — `cached_network_image` not in deps; uses `Image.network` with `loadingBuilder`
- [ ] **Deep linking** — Not configured in `AppRouting`
- [ ] **Analytics/Crashlytics** — Not present
- [ ] **Auth UI** — Verify `login_screen.dart`, `signup_screen.dart`, `forgot_password_screen.dart` completeness
- [ ] **Folder naming** — `side menu screens` has spaces; consider `side_menu_screens`
- [ ] **CheckoutCubit** — Commented registration in DI; verify if used

---

*YumQuick-specific supplement. See `~/.config/opencode/AGENTS.md` for generic architecture, templates, and scaffolding steps.*