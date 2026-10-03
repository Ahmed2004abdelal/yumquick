import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(FavoritesStatus.initial) FavoritesStatus favoriteStatus,
    @Default([]) List<ProductsModel> favoriteProducts,
    @Default('') String favoriteErrorMessage,
  }) = _FavoritesState;
}

enum FavoritesStatus { initial, loading, success, failure }
