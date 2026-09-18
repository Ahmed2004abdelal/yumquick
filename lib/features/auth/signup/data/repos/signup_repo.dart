import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/features/auth/signup/data/models/signup_request_model.dart';
import 'package:yumquick/features/auth/signup/data/models/signup_response_model.dart';

import '../../../../../core/networking/api_error_handler.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);
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
