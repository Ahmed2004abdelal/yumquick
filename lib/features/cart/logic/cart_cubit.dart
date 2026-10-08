import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/cart/data/models/get_cart_model.dart';
import 'package:yumquick/features/cart/data/repos/cart_repo.dart';
import 'package:yumquick/features/cart/logic/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(CartState()) {
    getCart();
  }

  double totalAmount(items) {
    final totalAmount = items.fold(
      0.0,
      (sum, item) => sum + item.totalItemPrice,
    );
    return totalAmount;
  }

  Future<void> getCart() async {
    if (state.cartItems.isEmpty) {
      emit(state.copyWith(status: CartStatus.loading));
    }
    final response = await _cartRepo.getCart();
    response.when(
      success: (cartData) {
        final items = cartData.products;
        final total = _calcTotal(items);
        final count = items.fold<int>(0, (sum, item) => sum + item.quantity);
        emit(
          state.copyWith(
            status: CartStatus.success,
            cartItems: items,
            totalPrice: total,
            itemCount: count,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: CartStatus.failure,
            error: error.apiErrorModel.message ?? "Failed to load cart",
          ),
        );
      },
    );
  }

  Future<void> removeItem(int cartItemId) async {
    final previousItems = state.cartItems;

    final remainingItems = previousItems
        .where((item) => item.id != cartItemId)
        .toList();
    emit(
      state.copyWith(
        actionStatus: CartStatus.loading,
        cartItems: remainingItems,
        totalPrice: _calcTotal(remainingItems),
        itemCount: _calcCount(remainingItems),
      ),
    );

    final response = await _cartRepo.removeItem(cartItemId);
    response.when(
      success: (_) {
        emit(state.copyWith(actionStatus: CartStatus.success));
      },
      failure: (error) {
        emit(
          state.copyWith(
            actionStatus: CartStatus.failure,
            actionError: error.apiErrorModel.message ?? "Failed to remove item",
            cartItems: previousItems,
            totalPrice: _calcTotal(previousItems),
            itemCount: _calcCount(previousItems),
          ),
        );
      },
    );
  }

  double _calcTotal(List<CartProduct> items) =>
      items.fold(0.0, (sum, i) => sum + i.totalItemPrice);

  int _calcCount(List<CartProduct> items) =>
      items.fold(0, (sum, i) => sum + i.quantity);

  Future<void> clearCart() async {
    emit(state.copyWith(actionStatus: CartStatus.loading));
    final response = await _cartRepo.clearCart();
    response.when(
      success: (_) {
        emit(
          state.copyWith(
            actionStatus: CartStatus.success,
            cartItems: [],
            totalPrice: 0.0,
            itemCount: 0,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            actionStatus: CartStatus.failure,
            actionError: error.apiErrorModel.message ?? "Failed to clear cart",
          ),
        );
      },
    );
  }
}
