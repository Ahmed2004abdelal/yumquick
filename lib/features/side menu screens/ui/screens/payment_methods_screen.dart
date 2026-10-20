import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/selection_dot.dart';
import 'package:yumquick/features/side%20menu%20screens/data/models/payment%20models/saved_card_model.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/payment%20logic/payment_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/payment%20logic/payment_state.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  void navigateToAddCardScreen(BuildContext context) {
    context.pushNamed(
      Routes.addCardScreen,
      arguments: context.read<PaymentCubit>(),
    );
    // if (!context.mounted) return;
    // context.read<PaymentCubit>().loadCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,

        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(title: 'Your Cards'),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(35.w),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            const Expanded(child: GetSavedCards()),
            verticalSpace(70),
            CustomButton(
              onPressed: () => navigateToAddCardScreen(context),
              text: 'Add New Card',
              textStyle: AppTextStyle.font17WhiteRegular,
            ),
          ],
        ),
      ),
    );
  }
}

class GetSavedCards extends StatelessWidget {
  const GetSavedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      buildWhen: (p, c) => p.cardsStatus != c.cardsStatus || p.cards != c.cards,
      builder: (context, state) {
        if (state.cardsStatus == PaymentFlowStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.cardsStatus == PaymentFlowStatus.failure) {
          return Center(child: Text(state.cardsError));
        } else if (state.cards.isEmpty) {
          return const Center(child: Text('No saved cards'));
        } else {
          return ListView.builder(
            itemCount: state.cards.length,
            itemBuilder: (context, index) {
              final card = state.cards[index];
              return GestureDetector(
                onTap: () {
                  context.read<PaymentCubit>().setDefaultCard(card.id);
                },
                child: SaveCardShow(card: card),
              );
            },
          );
        }
      },
    );
  }
}

class SaveCardShow extends StatelessWidget {
  final SavedCardModel card;
  const SaveCardShow({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(card.brand, style: AppTextStyle.font20BlackRegular),
            horizontalSpace(30),
            Text(
              '**** **** **** ${card.lastFourDigits}',
              style: AppTextStyle.font20BlackRegular,
            ),
            Spacer(),
            SelectionDot(
              isSelected:
                  context.select(
                    (PaymentCubit selector) => selector.state.selectedCardId,
                  ) ==
                  card.id,
            ),
          ],
        ),
        verticalSpace(20),
        Divider(color: AppColors.orangeTwo, thickness: 1.2),
      ],
    );
  }
}
