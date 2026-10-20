import 'package:yumquick/core/networking/api_error_handler.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/features/checkout/data/models/checkout%20models/checkout_request.dart';
import 'package:yumquick/features/checkout/data/models/checkout%20models/checkout_response.dart';

class CheckoutRepo {
  final ApiService _apiService;
  const CheckoutRepo(this._apiService);

  Future<ApiResult<CheckoutResponse>> checkout(CheckoutRequest request) async {
    try {
      return ApiResult.success(await _apiService.checkoutOrder(request));
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
