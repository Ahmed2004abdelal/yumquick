import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/cart/data/models/get_cart_model.dart';
import 'package:yumquick/features/checkout/data/models/checkout%20models/checkout_response.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/address%20models/get_address_response.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/saved_card_model.dart';

part 'checkout_state.freezed.dart';

@freezed
abstract class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(CheckoutStatus.initial) CheckoutStatus checkoutStatus,
    @Default(CheckoutStatus.initial) CheckoutStatus actionStatus,
    @Default(CheckoutStatus.initial) CheckoutStatus paymentStatus,
    CheckoutResponse? checkoutSuccessResponse,
    @Default([]) List<CartProduct> products,
    @Default(0.0) double totalPrice,
    @Default('') String checkoutError,
    @Default('') String paymentError,
    @Default(true) bool cashPaymentSelected,
    SavedCardModel? selectedCard,
    GetAddressResponse? address,
  }) = _CheckoutState;
}

enum CheckoutStatus { initial, loading, success, failure }

enum PaymentType { cash, card }
