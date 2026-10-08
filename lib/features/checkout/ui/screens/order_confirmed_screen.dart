import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  void goHome(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) goHome(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.yellowBase,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                const Spacer(flex: 2),
                Container(
                  width: 125.w,
                  height: 125.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.orangeBase, width: 6.w),
                  ),
                  child: Align(
                    alignment: const Alignment(-0.45, -0.1),
                    child: Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: const BoxDecoration(
                        color: AppColors.orangeBase,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                verticalSpace(24),
                Text(
                  '¡Order Confirmed!',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font24BlackSemiBold,
                ),
                verticalSpace(16),
                Text(
                  'Your order has been placed\nsuccessfully',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font16BlackLight,
                ),
                verticalSpace(30),
                Text(
                  'Delivery by Thu, 29th, 4:00 PM',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font16BlackLight,
                ),
                verticalSpace(24),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => goHome(context),
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      'Home',
                      style: AppTextStyle.font20OrangeBaseMedium,
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                Text(
                  'If you have any questions, please reach out\ndirectly to our customer support',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font16BlackLight,
                ),
                verticalSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
