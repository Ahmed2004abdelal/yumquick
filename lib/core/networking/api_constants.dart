class ApiConstants {
  static const String apiBaseUrl = "https://yumquick.tryasp.net/api/";

  //auth
  static const String login = "Auth/login";
  static const String signup = "Auth/register";
  static const String googleLogin = "Auth/google-login";
  //home
  static const String banners = "Banners";
  static const String categories = "Categories";
  static const String recommended = "Products/recommended";
  static const String productsByCategory = "Products";
  static const String addToCart = "Cart/add";
  static const String toggleFavorite = "Favorites/toggle/";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
