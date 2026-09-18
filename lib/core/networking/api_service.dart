import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yumquick/core/networking/api_constants.dart';
import 'package:yumquick/features/auth/login/data/models/google_login_request_model.dart';
import 'package:yumquick/features/auth/login/data/models/login_request_model.dart';
import 'package:yumquick/features/auth/login/data/models/login_response_model.dart';
import 'package:yumquick/features/auth/signup/data/models/signup_request_model.dart';
import 'package:yumquick/features/auth/signup/data/models/signup_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestBody);

  // @POST(ApiConstants.signup)
  // Future<SignupResponseModel> signup(
  //   @Body() SignupRequestModel signupRequestBody,
  // );

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
}
