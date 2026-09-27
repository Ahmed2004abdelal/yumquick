import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/home/data/models/banners_model.dart';

import '../../data/models/categories_model.dart';
import '../../data/models/products_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus bannersStatus,
    @Default(HomeStatus.initial) HomeStatus categoriesStatus,
    @Default(HomeStatus.initial) HomeStatus recommendStatus,
    @Default(HomeStatus.initial) HomeStatus productsByCategoryStatus,
    @Default([]) List<BannersModel> banners,
    @Default([]) List<CategoriesModel> categories,
    @Default([]) List<ProductsModel> recommend,
    @Default([]) List<ProductsModel> productsByCategory,
    @Default('') String bannersError,
    @Default('') String recommendError,
    @Default('') String categoriesError,
    @Default('') String productsByCategoryError,
    @Default(0) int categoryId,
  }) = _HomeState;
}

enum HomeStatus { initial, loading, success, failure, isloadingmore }
