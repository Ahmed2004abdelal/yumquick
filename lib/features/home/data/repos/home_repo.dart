import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/home/data/models/banners_model.dart';
import 'package:yumquick/features/home/data/models/categories_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_service.dart';
import '../models/products_model.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  Future<ApiResult<List<BannersModel>>> getBanners() async {
    try {
      final banners = await _apiService.getBanners();
      return ApiResult.success(banners);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CategoriesModel>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductsModel>>> getRecommended() async {
    try {
      final response = await _apiService.getRecommended();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Future<ApiResult<List<ProductsModel>>> getProductsByCategory(
  //   int categoryId,
  //   int pageSize,
  //   int currentPage,
  // ) async {
  //   try {
  //     print('==============================================');
  //     print("================$currentPage==================");
  //     print('==============================================');
  //     final response = await _apiService.getProductsByCategory(
  //       categoryId,
  //       pageSize,
  //       currentPage,
  //     );
  //     return ApiResult.success(response.data);
  //   } catch (error) {
  //     debugPrint('==============================================');
  //     debugPrint(error.toString());
  //     debugPrint('==============================================');
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }

  Future<ApiResult<List<ProductsModel>>> getProductsByCategory(
    int categoryId,
    int pageSize,
    int currentPage,
  ) async {
    try {
      final response = await _apiService.getProductsByCategory(
        categoryId,
        pageSize,
        currentPage,
        // DateTime.now().millisecondsSinceEpoch,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
