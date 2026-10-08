import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/payment%20logic/payment_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/payment%20logic/payment_state.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  CardFieldInputDetails? _card;

  void addNewCard(BuildContext context) {
    if (_card?.complete ?? false) {
      context.read<PaymentCubit>().saveCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Card')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CardFormField(
              style: CardFormStyle(
                backgroundColor: AppColors.orangeTwo, // خلفية الحقول
                textColor: Colors.black, // لون الكتابة
                placeholderColor: AppColors.font, // لون النص الإرشادي
                borderColor: AppColors.orangeBase, // لون الحدود
                borderWidth: 0,
                borderRadius: 16,
                cursorColor: const Color(0xFFE95322), // لون المؤشر
                fontSize: 16,
              ),
              onCardChanged: (card) => setState(() => _card = card),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () => addNewCard(context),
              text: "Save Card",
            ),
            SaveCardBlocListener(),
          ],
        ),
      ),
    );
  }
}

class SaveCardBlocListener extends StatelessWidget {
  const SaveCardBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listenWhen: (p, c) => p.saveCardStatus != c.saveCardStatus,
      listener: (context, state) {
        if (state.saveCardStatus == PaymentFlowStatus.loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
          return;
        }
        if (state.saveCardStatus == PaymentFlowStatus.initial) return;
        Navigator.pop(context);
        if (state.saveCardStatus == PaymentFlowStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Card saved successfully')),
          );
          Navigator.pop(context);
        } else if (state.saveCardStatus == PaymentFlowStatus.failure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.saveCardError)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
