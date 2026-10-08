import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:yumquick/core/helper/constants.dart';
import 'package:yumquick/core/helper/shared_pref_helper.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/stripe_payment_service.dart';
import 'package:yumquick/features/cart/data/repos/cart_repo.dart';
import 'package:yumquick/features/checkout/data/models/checkout%20models/checkout_request.dart';
import 'package:yumquick/features/checkout/data/models/checkout%20models/checkout_screen_model.dart';
import 'package:yumquick/features/checkout/data/repos/checkout_repo.dart';
import 'package:yumquick/features/checkout/logic/checkout_state.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/get_address_response.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/saved_card_model.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  // ignore: unused_field
  final CheckoutRepo _checkoutRepo;
  final CartRepo _cartRepo;
  final StripePaymentService _stripe;
  bool isSelected = true;

  CheckoutCubit(this._checkoutRepo, this._cartRepo, this._stripe, CheckoutScreenModel model)
    : super(
        CheckoutState(
          products: List.of(model.products),
          totalPrice: model.totalPrice,
        ),
      ) {
    selectedAddress();
    getSelectedCard();
  }

  Future<void> getSelectedCard() async {
    final results = await Future.wait([
      SharedPrefHelper.getInt(SharedPrefKeys.selectedCardId),
      SharedPrefHelper.getString(SharedPrefKeys.selectedCardLastFourDigits),
      SharedPrefHelper.getString(SharedPrefKeys.selectedCardBrand),
    ]);
    if (isClosed) return;

    final id = results[0] as int?;
    if (id == null || id == 0) return; // مفيش كارت محفوظ

    log('Selected card: $results');

    emit(
      state.copyWith(
        selectedCard: SavedCardModel(
          id: id,
          lastFourDigits: results[1] as String? ?? '',
          brand: results[2] as String? ?? '',
          isDefault: true,
        ),
      ),
    );
  }

  double _calcTotal(Iterable<dynamic> items) =>
      items.fold<double>(0, (sum, i) => sum + i.totalItemPrice);

  Future<void> cancelItem(int cartItemId) async {
    final index = state.products.indexWhere((i) => i.id == cartItemId);
    if (index == -1) return;
    final removed = state.products[index];

    final updated = [...state.products]..removeAt(index);
    emit(state.copyWith(products: updated, totalPrice: _calcTotal(updated)));

    final response = await _cartRepo.removeItem(cartItemId);
    if (isClosed) return;

    response.when(
      success: (_) {},
      failure: (_) {
        final restored = [...state.products]
          ..insert(index.clamp(0, state.products.length), removed);
        emit(
          state.copyWith(
            products: restored,
            totalPrice: _calcTotal(restored),
            actionStatus: CheckoutStatus.failure,
          ),
        );
        emit(state.copyWith(actionStatus: CheckoutStatus.initial));
      },
    );
  }

  Future<void> selectedAddress() async {
    final address = await Future.wait([
      SharedPrefHelper.getInt(SharedPrefKeys.defaultAddressId),
      SharedPrefHelper.getString(SharedPrefKeys.defaultAddress),
    ]);
    if (isClosed) return;
    emit(
      state.copyWith(
        address: GetAddressResponse(
          id: address[0] as int? ?? 0,
          address: address[1] as String? ?? '',
          isDefault: true,
        ),
      ),
    );
  }

  void selectPaymentType() {
    emit(state.copyWith(cashPaymentSelected: !state.cashPaymentSelected));
  }

Future<void> payment() async {
  if (state.checkoutStatus == CheckoutStatus.loading) return; 
  final address = state.address;
  if (address == null || address.id == 0) {
    emit(state.copyWith(
      checkoutStatus: CheckoutStatus.failure,
      checkoutError: 'Please select an address',
    ));
    emit(state.copyWith(checkoutStatus: CheckoutStatus.initial));
    return;
  }

  final hasSavedCard =
      state.selectedCard != null && state.selectedCard!.id != 0;

  emit(state.copyWith(checkoutStatus: CheckoutStatus.loading));

  final response = await _checkoutRepo.checkout(
    CheckoutRequest(
      addressId: address.id,
      paymentMethod: hasSavedCard ? 'SavedCard' : 'Card',
      savedCardId: hasSavedCard ? state.selectedCard!.id : 0,
    ),
  );
  if (isClosed) return;

  await response.when(
    success: (data) async {
      final secret = data.clientSecret;
      if (secret == null || secret.isEmpty) {
        _emitPaymentFailure('Missing payment secret');
        return;
      }

      final result = hasSavedCard
          ? await _stripe.confirmWithClientSecret(secret)
          : await _stripe.payWithPaymentSheet(secret);
      if (isClosed) return;

      if (result.isSuccess) {
        emit(state.copyWith(
          checkoutStatus: CheckoutStatus.success,
          checkoutSuccessResponse: data,
        ));
      } else if (result.outcome == StripeOutcome.canceled) {
        emit(state.copyWith(checkoutStatus: CheckoutStatus.initial));
      } else {
        _emitPaymentFailure(result.message ?? 'Payment failed');
      }
    },
    failure: (error) async {
      _emitPaymentFailure(error.apiErrorModel.message ?? 'Checkout failed');
    },
  );
}

void _emitPaymentFailure(String message) {
  emit(state.copyWith(
    checkoutStatus: CheckoutStatus.failure,
    checkoutError: message,
  ));
  emit(state.copyWith(checkoutStatus: CheckoutStatus.initial));
}
}
