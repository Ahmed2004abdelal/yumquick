import 'package:yumquick/core/networking/api_error_handler.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/save_payment_method_request.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/saved_card_model.dart';

class PaymentRepo {
  final ApiService _apiService;
  PaymentRepo(this._apiService);

  Future<ApiResult<List<SavedCardModel>>> getCards() async {
    try {
      return ApiResult.success(await _apiService.getPaymentMethods());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> saveCard(SavePaymentMethodRequest request) async {
    try {
      await _apiService.savePaymentMethod(request);
      return ApiResult<void>.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> setDefaultCard(int cardId) async {
    try {
      await _apiService.setDefaultPaymentMethod(cardId);
      return ApiResult<void>.success(null);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
