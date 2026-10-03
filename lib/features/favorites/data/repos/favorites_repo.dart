import 'package:yumquick/core/networking/api_error_handler.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';

class FavoritesRepo {
  final ApiService _apiService;

  FavoritesRepo(this._apiService);

  Future<ApiResult<List<ProductsModel>>> getFavorites() async {
    try {
      final response = await _apiService.getFavorites();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
