import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yumquick/features/home/data/models/add_to_cart_model.dart';
import 'package:yumquick/features/home/data/models/banners_model.dart';
import 'package:yumquick/features/home/data/models/product_favorite_model.dart';

import '../../features/home/data/models/categories_model.dart';
import '../../features/home/data/models/products_model.dart';
import '../../features/home/data/models/products_response_model.dart';
import 'api_constants.dart';
import '../../features/auth/login/data/models/google_login_request_model.dart';
import '../../features/auth/login/data/models/login_request_model.dart';
import '../../features/auth/login/data/models/login_response_model.dart';
import '../../features/auth/signup/data/models/signup_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
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

  // @POST(ApiConstants.toggleFavorite)
  // Future<ToggleFavoriteModel> toggleFavorite(@Path("productId") int productId);

  @POST('${ApiConstants.toggleFavorite}/{productId}')
  Future<ToggleFavoriteModel> toggleFavorite(@Path('productId') int productId);
}
