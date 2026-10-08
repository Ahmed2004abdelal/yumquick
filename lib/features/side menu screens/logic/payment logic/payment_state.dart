import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/saved_card_model.dart';

part 'payment_state.freezed.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    //Saved Cards
    @Default(PaymentFlowStatus.initial) PaymentFlowStatus cardsStatus,
    @Default([]) List<SavedCardModel> cards,
    @Default('') String cardsError,
    int? selectedCardId,
    @Default(PaymentFlowStatus.initial) PaymentFlowStatus saveCardStatus,
    @Default('') String saveCardError,
    // @Default('') String setDefaultCardError,
    // @Default('') String setDefaultCardSuccessMessage,
    // @Default(PaymentFlowStatus.initial) PaymentFlowStatus payStatus,
    // @Default('') String payError,
    // int? orderId,
  }) = _PaymentState;
}

enum PaymentFlowStatus { initial, loading, success, failure }
