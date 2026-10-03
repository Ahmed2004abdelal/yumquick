import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yumquick/core/utils/models/deafult_response.dart';
import 'package:yumquick/features/cart/data/models/get_cart_model.dart';
import 'package:yumquick/features/cart/data/models/cart_action_models.dart';
import 'package:yumquick/features/home/data/models/add_to_cart_model.dart';
import 'package:yumquick/features/home/data/models/banners_model.dart';
import 'package:yumquick/features/home/data/models/product_favorite_model.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/add_address_request.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/add_address_response.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/get_address_response.dart';

import '../../features/home/data/models/categories_model.dart';
import '../../features/home/data/models/products_model.dart';
import '../../features/home/data/models/products_response_model.dart';
import 'api_constants.dart';
import '../../features/auth/login/data/models/google_login_request_model.dart';
import '../../features/auth/login/data/models/login_request_model.dart';
import '../../features/auth/login/data/models/login_response_model.dart';
import '../../features/auth/signup/data/models/signup_response_model.dart';

part 'api_service.g.dart';

// @RestApi(baseUrl: ApiConstants.apiBaseUrl)
@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestBody);

  @POST(ApiConstants.signup)
  @MultiPart()
  Future<SignupResponseModel> signup(
    @Part(name: "FullName") String fullName,
    @Part(name: "Email") String email,
    @Part(name: "PhoneNumber") String phoneNumber,
    @Part(name: "Password") String password,
    @Part(name: "Role") String role,
  );

  @POST(ApiConstants.googleLogin)
  Future<LoginResponseModel> googleLogin(
    @Body() GoogleLoginRequestModel googleLoginRequestModel,
  );

  @GET(ApiConstants.banners)
  Future<List<BannersModel>> getBanners();

  @GET(ApiConstants.categories)
  Future<List<CategoriesModel>> getCategories();

  @GET(ApiConstants.recommended)
  Future<List<ProductsModel>> getRecommended();

  @GET(ApiConstants.productsByCategory)
  Future<ProductsResponseModel> getProductsByCategory(
    @Query("categoryId") int categoryId,
    @Query("pageSize") int pageSize,
    @Query("pageNumber") int pageNumber,
    // @Query("_t") int cacheBuster,
  );

  @POST(ApiConstants.addToCart)
  Future<AddToCartResponse> addToCart(
    @Body() AddToCartRequest addToCartRequest,
  );

  @GET(ApiConstants.getCart)
  Future<GetCartModel> getCart();

  @DELETE('${ApiConstants.removeCartItem}/{id}')
  Future<RemoveCartResponse> removeCartItem(@Path('id') int id);

  // @POST(ApiConstants.checkout)
  // Future<CheckoutResponse> checkout(@Body() CheckoutRequest checkoutRequest);

  @DELETE(ApiConstants.clearCart)
  Future<ClearCartResponse> clearCart();

  @POST('${ApiConstants.toggleFavorite}/{productId}')
  Future<ToggleFavoriteModel> toggleFavorite(@Path('productId') int productId);

  @GET(ApiConstants.favorites)
  Future<List<ProductsModel>> getFavorites();

  @POST(ApiConstants.addAddress)
  Future<AddAddressResponse> addAddress(
    @Body() AddAddressRequest addressRequest,
  );

  @GET(ApiConstants.addAddress)
  Future<List<GetAddressResponse>> getAddress();

  @PUT('${ApiConstants.setDefaultAddress}/{addressId}')
  Future<DefaultResponse> setDefaultAddress(@Path('addressId') int addressId);
}
