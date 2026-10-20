import 'package:bloc/bloc.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/home/data/models/add_to_cart_model.dart';
import 'package:yumquick/features/home/data/models/product_favorite_model.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';
import 'package:yumquick/features/home/data/repos/product_repo.dart';
import 'package:yumquick/features/home/logic/product%20details/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductRepo _productRepo;
  final ProductsModel product;

  ProductDetailsCubit(this._productRepo, {required this.product})
    : super(ProductDetailsState(price: product.finalPrice)) {
    _recalculatePrice();
  }

  double get _toppingsTotal => product.toppings
      .where((topping) => state.selectedToppingIds.contains(topping.id))
      .fold(0.0, (sum, topping) => sum + topping.extraPrice);

  void increaseAmount() {
    emit(state.copyWith(amount: state.amount + 1));
    _recalculatePrice();
  }

  void decreaseAmount() {
    if (state.amount <= 1) return;
    emit(state.copyWith(amount: state.amount - 1));
    _recalculatePrice();
  }

  Future<void> toggleFavorite() async {
    emit(state.copyWith(toggleFavoriteStatus: ProductDetailsStatus.loading));
    final response = await _productRepo.toggleFavorite(
      // IsFavoriteRequest(productId: product.id),
      product.id,
    );
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            toggleFavoriteStatus: ProductDetailsStatus.success,
            isFavorite: data.isFavorite ?? false,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            toggleFavoriteStatus: ProductDetailsStatus.failure,
            toggleFavoriteErrorMessage:
                error.apiErrorModel.message ?? "========error========",
          ),
        );
      },
    );
  }

  void toggleTopping(int toppingId) {
    final updatedIds = Set<int>.from(state.selectedToppingIds);
    if (!updatedIds.remove(toppingId)) {
      updatedIds.add(toppingId);
    }
    emit(state.copyWith(selectedToppingIds: updatedIds));
    _recalculatePrice();
  }

  void _recalculatePrice() {
    final total = (product.finalPrice + _toppingsTotal) * state.amount;
    emit(state.copyWith(price: total));
  }

  Future<void> addToCart() async {
    emit(state.copyWith(addToCartStatus: ProductDetailsStatus.loading));
    final response = await _productRepo.addToCart(
      AddToCartRequest(
        productId: product.id,
        quantity: state.amount,
        variantIds: state.selectedToppingIds.toList(),
      ),
    );
    response.when(
      success: (data) {
        emit(state.copyWith(addToCartStatus: ProductDetailsStatus.success));
      },
      failure: (error) {
        emit(
          state.copyWith(
            addToCartStatus: ProductDetailsStatus.failure,
            addToCartErrorMessage:
                error.apiErrorModel.message ?? "========error========",
          ),
        );
      },
    );
  }
}
