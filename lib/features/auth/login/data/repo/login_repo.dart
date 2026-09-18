import 'package:google_sign_in/google_sign_in.dart';
import 'package:yumquick/features/auth/login/data/models/google_login_request_model.dart';
import 'package:yumquick/features/auth/login/data/models/login_request_model.dart';
import 'package:yumquick/features/auth/login/data/models/login_response_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class LoginRepo {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseModel>> login(LoginRequestModel request) async {
    try {
      final response = await _apiService.login(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

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

      print('✅ Google Sign-In success');
      print('Email: ${account.email}');
      print('Name: ${account.displayName}');
      print('ID Token: $idToken');

      // 👇 لفّ الـ idToken جوه الموديل
      final requestModel = GoogleLoginRequestModel(providerToken: idToken);

      final response = await _apiService.googleLogin(requestModel);
      return ApiResult.success(response);
    } catch (e) {
      print('❌ Google Sign-In error: $e');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
