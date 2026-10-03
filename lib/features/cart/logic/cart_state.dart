import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/cart/data/models/get_cart_model.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(CartStatus.initial) CartStatus status,
    @Default('') String error,
    @Default([]) List<CartProduct> cartItems,
    @Default(0.0) double totalPrice,
    @Default(0) int itemCount,
    @Default(CartStatus.initial) CartStatus actionStatus,
    @Default('') String actionError,
  }) = _CartState;
}

enum CartStatus { initial, loading, success, failure }

// enum CartActionStatus { initial, loading, success, failure }
