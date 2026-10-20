import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/features/checkout/logic/checkout_cubit.dart';
import 'package:yumquick/features/checkout/logic/checkout_state.dart';

class OrderPaymentScreen extends StatelessWidget {
  const OrderPaymentScreen({super.key});

  void paymentButton(BuildContext context) {
    context.read<CheckoutCubit>().payment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        toolbarHeight: 100.h,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(title: 'Payment'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Summary", style: AppTextStyle.font20BlackMedium),
            OrderSummary(),
            verticalSpace(10),
            Divider(color: AppColors.orangeTwo, thickness: 1, height: 30.h),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method", style: AppTextStyle.font20BlackMedium),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 58.w,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      color: AppColors.orangeTwo,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Edit",
                      style: AppTextStyle.font12OrangeBaseRegular,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(13),
            PaymentMethod(),
            verticalSpace(10),
            Divider(color: AppColors.orangeTwo, thickness: 1, height: 30.h),
            verticalSpace(10),
            Text("Delivery Time", style: AppTextStyle.font20BlackMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Estimated Delivery',
                  style: AppTextStyle.font14BlackLight,
                ),
                Text('25-35 min', style: AppTextStyle.font20OrangeBaseMedium),
              ],
            ),
            verticalSpace(10),
            Divider(color: AppColors.orangeTwo, thickness: 1, height: 30.h),
            Spacer(),
            Center(
              child: CustomButton(
                onPressed: () => paymentButton(context),
                text: "Pay Now",
              ),
            ),
            verticalSpace(30),
            PaymentBlocListener(),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<CheckoutCubit>().state.selectedCard == null
        ? CustomButton(
            onPressed: () {},
            text: "No saved card, add a card",
            width: double.infinity,
          )
        : Row(
            children: [
              SvgPicture.asset(
                'assets/icons/card-icon.svg',
                width: 31.w,
                height: 21.21.h,
              ),
              horizontalSpace(9),
              Text(
                context.read<CheckoutCubit>().state.selectedCard?.brand ??
                    'Credit Card',
                style: AppTextStyle.font14BlackLight,
              ),
              Spacer(),
              Container(
                width: 157.w,
                height: 17.01.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.72.r),
                  color: AppColors.yellowTwo,
                ),
                child: Center(
                  child: Text(
                    "**** **** **** ${context.read<CheckoutCubit>().state.selectedCard?.lastFourDigits ?? '1111'}",
                    style: AppTextStyle.font14BlackLight,
                  ),
                ),
              ),
            ],
          );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            context.read<CheckoutCubit>().state.products.length,
            (index) {
              return SizedBox(
                width: 200.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context
                          .read<CheckoutCubit>()
                          .state
                          .products[index]
                          .productName,
                      maxLines: 1,
                      style: AppTextStyle.font14BlackLight.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${context.read<CheckoutCubit>().state.products[index].quantity} items",
                      style: AppTextStyle.font14OrangeBaseLight,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Text(
          '\$${context.read<CheckoutCubit>().state.totalPrice.toStringAsFixed(2)}',
          style: AppTextStyle.font20BlackMedium,
        ),
      ],
    );
  }
}

class PaymentBlocListener extends StatelessWidget {
  const PaymentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listenWhen: (p, c) => p.checkoutStatus != c.checkoutStatus,
      listener: (context, state) {
        if (state.checkoutStatus == CheckoutStatus.success) {
          context.pushNamedAndRemoveUntil(
            Routes.orderConfirmedScreen,
            predicate: (r) => false,
          );
        } else if (state.checkoutStatus == CheckoutStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.checkoutError),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
