import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/save_payment_method_request.dart';

enum StripeOutcome { success, canceled, failed }

class StripeResult {
  final StripeOutcome outcome;
  final String? message;
  const StripeResult(this.outcome, [this.message]);

  bool get isSuccess => outcome == StripeOutcome.success;
}

class StripePaymentService {
  // مفيش private constructor ولا static instance، GetIt بيدير الـ singleton.
  StripePaymentService();

  StripeResult _fromError(Object e) {
    if (e is StripeException) {
      if (e.error.code == FailureCode.Canceled) {
        return const StripeResult(StripeOutcome.canceled, 'Payment canceled');
      }
      return StripeResult(
        StripeOutcome.failed,
        e.error.localizedMessage ?? 'Payment failed',
      );
    }
    return StripeResult(StripeOutcome.failed, e.toString());
  }

  Future<StripeResult> payWithPaymentSheet(String clientSecret) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'YumQuick',
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      return const StripeResult(StripeOutcome.success);
    } catch (e) {
      return _fromError(e);
    }
  }

  Future<SavePaymentMethodRequest> createPaymentMethod() async {
    final pm = await Stripe.instance.createPaymentMethod(
      params: const PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      ),
    );
    return SavePaymentMethodRequest(
      token: pm.id,
      lastFourDigits: pm.card.last4 ?? '',
      brand: pm.card.brand ?? '',
    );
  }

  Future<StripeResult> confirmWithClientSecret(String clientSecret) async {
    try {
      final intent = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
      );
      if (intent.status == PaymentIntentsStatus.Succeeded) {
        return const StripeResult(StripeOutcome.success);
      }
      return StripeResult(
        StripeOutcome.failed,
        'Payment not completed (${intent.status.name})',
      );
    } catch (e) {
      return _fromError(e);
    }
  }
}
