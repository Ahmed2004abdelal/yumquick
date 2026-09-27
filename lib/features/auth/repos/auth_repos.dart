import 'package:google_sign_in/google_sign_in.dart';

import '../login/data/models/google_login_request_model.dart';
import '../login/data/models/login_request_model.dart';
import '../login/data/models/login_response_model.dart';
import '../signup/data/models/signup_request_model.dart';
import '../signup/data/models/signup_response_model.dart';

import '../../../core/networking/api_error_handler.dart';
import '../../../core/networking/api_result.dart';
import '../../../core/networking/api_service.dart';

class AuthRepos {
  final ApiService _apiService;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  AuthRepos(this._apiService);

  //login
  Future<ApiResult<LoginResponseModel>> login(LoginRequestModel request) async {
    try {
      final response = await _apiService.login(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  //google oauth
  Future<ApiResult<LoginResponseModel>> googleOauth() async {
    try {
      final account = await _googleSignIn.authenticate();

      final auth = account.authentication;
      final idToken = auth.idToken;
      if (idToken == null) {
        return ApiResult.failure(
          ErrorHandler.handle(Exception('Failed to get Google ID token')),
        );
      }
      final requestModel = GoogleLoginRequestModel(providerToken: idToken);
      final response = await _apiService.googleLogin(requestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  //sign up
  Future<ApiResult<SignupResponseModel>> signup(
    SignupRequestModel request,
  ) async {
    try {
      // final response = await _apiService.signup(request);
      final response = await _apiService.signup(
        request.fullName,
        request.email,
        request.phoneNumber,
        request.password,
        request.role,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
