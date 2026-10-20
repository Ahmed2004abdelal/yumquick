import 'package:yumquick/core/networking/api_error_handler.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/features/cart/data/models/cart_action_models.dart';
import 'package:yumquick/features/cart/data/models/get_cart_model.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<GetCartModel>> getCart() async {
    try {
      final response = await _apiService.getCart();
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RemoveCartResponse>> removeItem(int cartItemId) async {
    try {
      final response = await _apiService.removeCartItem(cartItemId);
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ClearCartResponse>> clearCart() async {
    try {
      final response = await _apiService.clearCart();
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
