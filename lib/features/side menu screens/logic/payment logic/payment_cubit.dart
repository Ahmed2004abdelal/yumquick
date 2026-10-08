import 'package:bloc/bloc.dart';
import 'package:yumquick/core/helper/constants.dart';
import 'package:yumquick/core/helper/shared_pref_helper.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/stripe_payment_service.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/save_payment_method_request.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/saved_card_model.dart';
import 'package:yumquick/features/side%20menu%20screens/data/repos/payment_repo.dart';

import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _repo;
  final StripePaymentService _stripe;

  PaymentCubit(this._repo, this._stripe) : super(const PaymentState()) {
    loadCards();
  }
  void selectCard(int? cardId) => emit(state.copyWith(selectedCardId: cardId));

  //! 7st5dem hive enshallah
  void saveSelectedCard(SavedCardModel value) {
    SharedPrefHelper.setData(SharedPrefKeys.selectedCardId, value.id);
    SharedPrefHelper.setData(SharedPrefKeys.selectedCardBrand, value.brand);
    SharedPrefHelper.setData(
      SharedPrefKeys.selectedCardLastFourDigits,
      value.lastFourDigits,
    );
  }

  Future<void> loadCards() async {
    if (state.cards.isEmpty) {
      emit(state.copyWith(cardsStatus: PaymentFlowStatus.loading));
    }
    final res = await _repo.getCards();
    if (isClosed) return;
    res.when(
      success: (cards) {
        if (cards.isEmpty) {
          emit(
            state.copyWith(
              cardsStatus: PaymentFlowStatus.success,
              cards: cards,
              selectedCardId: null,
            ),
          );
          return;
        }
        final selected = cards.firstWhere(
          (card) => card.isDefault,
          orElse: () => cards.first,
        );
        emit(
          state.copyWith(
            cardsStatus: PaymentFlowStatus.success,
            cards: cards,
            selectedCardId: selected.id,
          ),
        );
        saveSelectedCard(selected);
      },
      failure: (e) => emit(
        state.copyWith(
          cardsStatus: PaymentFlowStatus.failure,
          cardsError: e.apiErrorModel.message ?? 'An error occurred',
        ),
      ),
    );
  }

  Future<void> saveCard() async {
    emit(state.copyWith(saveCardStatus: PaymentFlowStatus.loading));
    try {
      final card = await _stripe.createPaymentMethod();
      final res = await _repo.saveCard(
        SavePaymentMethodRequest(
          token: card.token,
          lastFourDigits: card.lastFourDigits,
          brand: card.brand,
        ),
      );
      if (isClosed) return;
      res.when(
        success: (_) {
          emit(state.copyWith(saveCardStatus: PaymentFlowStatus.success));
          loadCards();
        },
        failure: (e) => emit(
          state.copyWith(
            saveCardStatus: PaymentFlowStatus.failure,
            saveCardError: e.apiErrorModel.message ?? 'An error occurred',
          ),
        ),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          saveCardStatus: PaymentFlowStatus.failure,
          saveCardError: e.toString(),
        ),
      );
    }
  }

  Future<void> setDefaultCard(int cardId) async {
    final res = await _repo.setDefaultCard(cardId);
    if (isClosed) return;
    res.when(
      success: (_) {
        saveSelectedCard(state.cards.firstWhere((card) => card.id == cardId));
        selectCard(cardId);
      },
      failure: (_) {},
    );
  }

  // ───────── السيناريو 1: دفع بكارت جديد ─────────
  // POST checkout (Card) -> clientSecret -> PaymentSheet
  // Future<void> payWithNewCard({required int addressId}) async {
  //   await _pay(
  //     CheckoutRequest.newCard(addressId: addressId),
  //     (secret) => _stripe.payWithPaymentSheet(secret),
  //   );
  // }

  // ───────── السيناريو 3: دفع بكارت محفوظ ─────────
  // POST checkout (SavedCard) -> clientSecret جديد -> confirmPayment
  // Future<void> payWithSavedCard({
  //   required int addressId,
  //   required int savedCardId,
  // }) async {
  //   await _pay(
  //     CheckoutRequest.savedCard(
  //       addressId: addressId,
  //       savedCardId: savedCardId,
  //     ),
  //     (secret) => _stripe.confirmWithClientSecret(secret),
  //   );
  // }

  // Future<void> _pay(
  //   CheckoutRequest request,
  //   Future<StripeResult> Function(String clientSecret) confirm,
  // ) async {
  //   if (state.payStatus == PaymentFlowStatus.loading) return; // امنع الضغط المزدوج
  //   emit(state.copyWith(payStatus: PaymentFlowStatus.loading, payError: ''));

  //   final res = await _repo.checkout(request);
  //   if (isClosed) return;

  //   await res.when(
  //     success: (order) async {
  //       final result = await confirm(order.clientSecret);
  //       if (isClosed) return;

  //       if (result.isSuccess) {
  //         // الـ webhook هو اللي بيحدّث الطلب لـ Paid على السيرفر
  //         emit(
  //           state.copyWith(
  //             payStatus: PaymentFlowStatus.success,
  //             orderId: order.orderId,
  //           ),
  //         );
  //       } else {
  //         emit(
  //           state.copyWith(
  //             payStatus: PaymentFlowStatus.failure,
  //             payError: result.message ?? 'Payment failed',
  //           ),
  //         );
  //       }
  //     },
  //     failure: (e) async => emit(
  //       state.copyWith(
  //         payStatus: PaymentFlowStatus.failure,
  //         payError: e.apiErrorModel.message ?? 'An error occurred',
  //       ),
  //     ),
  //   );

  //   // ريست عشان الـ listener يشتغل لو المستخدم حاول تاني بنفس النتيجة
  //   if (!isClosed && state.payStatus == PaymentFlowStatus.failure) {
  //     emit(state.copyWith(payStatus: PaymentFlowStatus.initial));
  //   }
  // }
}
