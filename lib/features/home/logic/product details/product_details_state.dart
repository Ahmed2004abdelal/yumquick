import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_state.freezed.dart';

enum ProductDetailsStatus { initial, loading, success, failure }

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    @Default(ProductDetailsStatus.initial) ProductDetailsStatus addToCartStatus,
    @Default(ProductDetailsStatus.initial)
    ProductDetailsStatus toggleFavoriteStatus,
    @Default('') String toggleFavoriteErrorMessage,
    @Default('') String addToCartErrorMessage,
    @Default(1) int amount,
    @Default(0.0) double price,
    @Default(false) bool isFavorite,
    @Default(<int>{}) Set<int> selectedToppingIds,
  }) = _ProductDetailsState;
}
