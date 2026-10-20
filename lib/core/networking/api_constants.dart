class ApiConstants {
  // static final String apiBaseUrl = Env.apiUrl;

  //auth
  static const String login = "Auth/login";
  static const String signup = "Auth/register";
  static const String googleLogin = "Auth/google-login";

  //home
  static const String banners = "Banners";
  static const String categories = "Categories";
  static const String recommended = "Products/recommended";
  static const String productsByCategory = "Products";
  static const String toggleFavorite = "Favorites/toggle/";

  //favorites
  static const String favorites = "Favorites";

  //cart
  static const String addToCart = "Cart/add";
  static const String getCart = "Cart";
  static const String removeCartItem = "Cart/remove";
  static const String clearCart = "Cart/clear";

  //checkout
  static const String checkout = "Orders/checkout";

  //address
  static const String addAddress = "Addresses";
  static const String setDefaultAddress = "Addresses/set-default/";

  //payment
  static const String paymentMethods = "PaymentMethods";
  static const String setDefault = "/set-default";

  //orders
  static const String myOrders = 'Orders';
  static const String cancelOrders = '/cancel';
  static const String addReview = 'Reviews';

  //help
  static const String issues = 'Tickets';
  static const String issueReply = 'reply';
  static const String issueClose = 'close';
  static const String contactInfo = 'Settings/contact-info';
  static const String faqs = 'Settings/faqs';
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
