import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/features/home/data/models/add_to_cart_model.dart';
import 'package:yumquick/features/home/data/models/product_favorite_model.dart';

import '../../../../core/networking/api_error_handler.dart';

class ProductRepo {
  final ApiService apiService;
  ProductRepo(this.apiService);

  Future<ApiResult<ToggleFavoriteModel>> toggleFavorite(
    // IsFavoriteRequest request,
    int productId,
  ) async {
    try {
      final response = await apiService.toggleFavorite(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AddToCartResponse>> addToCart(
    AddToCartRequest addToCartRequest,
  ) async {
    try {
      final response = await apiService.addToCart(addToCartRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
