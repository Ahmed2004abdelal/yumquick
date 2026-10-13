import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/helpers_functions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/selection_dot.dart';
import 'package:yumquick/features/my-orders/data/models/cancel_order_text_model.dart';
import 'package:yumquick/features/my-orders/logic/orders_cubit.dart';

class CancelOrderScreen extends StatelessWidget {
  final int orderId;
  const CancelOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final selectedId = context.select<OrdersCubit, int?>(
      (cubit) => cubit.state.cancelOrderSelectedId,
    );
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        toolbarHeight: 100.h,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(
          title: "Cancel Order",
          showBackButton: true,
        ),
      ),
      body: Center(
        child: Container(
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
              Text(
                'Please tell us why you want to cancel your order. Your feedback helps us improve our service.',
              ),
              verticalSpace(14),
              const Divider(height: 1, color: AppColors.orangeTwo),
              Column(
                children: List.generate(
                  cancelOrderTextList.length,
                  (index) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<OrdersCubit>().selectCancelOrderReason(
                            cancelOrderTextList[index].id,
                          );
                        },
                        child: SizedBox(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(cancelOrderTextList[index].text),
                              SelectionDot(
                                isSelected:
                                    selectedId == cancelOrderTextList[index].id,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 1, color: AppColors.orangeTwo),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                onPressed: () {
                  if (selectedId == null) {
                    showSnack(
                      context,
                      'Please select a reason for cancellation',
                      Colors.red,
                    );
                    return;
                  }
                  context.read<OrdersCubit>().cancelOrder(orderId);
                  context.pop();
                },
                text: 'Submit',
              ),
              verticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
