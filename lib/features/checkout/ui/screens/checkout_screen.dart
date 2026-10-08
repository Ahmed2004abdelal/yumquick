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
import 'package:yumquick/features/cart/data/models/get_cart_model.dart';
import 'package:yumquick/features/checkout/logic/checkout_cubit.dart';
import 'package:yumquick/features/checkout/logic/checkout_state.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  Future<void> navigateToAddressScreen(BuildContext context) async {
    await Navigator.pushNamed(context, Routes.addressScreen);
    if (!context.mounted) return;
    context.read<CheckoutCubit>().selectedAddress();
  }

  placeOrderPressed(BuildContext context) {
    context.pushNamed(
      Routes.orderPayment,
      arguments: context.read<CheckoutCubit>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CheckoutCubit, CheckoutState>(
          listenWhen: (p, c) => p.actionStatus != c.actionStatus,
          listener: (context, state) {
            if (state.actionStatus == CheckoutStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to remove item'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
        BlocListener<CheckoutCubit, CheckoutState>(
          listenWhen: (p, c) => p.products.isNotEmpty && c.products.isEmpty,
          listener: (context, state) => Navigator.pop(context),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.yellowBase,
        appBar: AppBar(
          backgroundColor: AppColors.yellowBase,
          automaticallyImplyLeading: false,
          flexibleSpace: CustomAppBar(title: 'Confirm Order'),
          toolbarHeight: 100,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Address',
                      style: AppTextStyle.font24BlackSemiBold,
                    ),
                    IconButton(
                      onPressed: () => navigateToAddressScreen(context),
                      icon: Icon(
                        Icons.edit_outlined,
                        color: AppColors.orangeBase,
                        size: 25.w,
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                BlocBuilder<CheckoutCubit, CheckoutState>(
                  buildWhen: (p, c) => p.address != c.address,
                  builder: (context, state) {
                    final address = state.address;
                    if (address == null || address.address.isEmpty) {
                      return CustomButton(
                        backgroundColor: AppColors.orangeBase,
                        // foregroundColor: AppColors.orangeBase,
                        width: double.infinity,
                        onPressed: () => navigateToAddressScreen(context),
                        text: 'No address selected, please select an address',
                      );
                    }
                    return Container(
                      padding: EdgeInsetsDirectional.only(start: 15.w),
                      height: 35.h,
                      alignment: AlignmentDirectional.centerStart,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.yellowTwo,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        address.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.font15OrangeBaseSemiBold,
                      ),
                    );
                  },
                ),
                verticalSpace(10),
                Text('Payment Method', style: AppTextStyle.font24BlackSemiBold),
                GestureDetector(
                  onTap: () {
                    context.read<CheckoutCubit>().selectPaymentType();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cash', style: AppTextStyle.font24BlackSemiBold),
                      SelectionDot(
                        isSelected: context
                            .watch<CheckoutCubit>()
                            .state
                            .cashPaymentSelected,
                      ),
                    ],
                  ),
                ),
                verticalSpace(50),
                Text('Order Summary', style: AppTextStyle.font20BlackMedium),
                Divider(color: AppColors.orangeTwo, thickness: 1),
                BlocBuilder<CheckoutCubit, CheckoutState>(
                  buildWhen: (p, c) =>
                      p.products != c.products || p.totalPrice != c.totalPrice,
                  builder: (context, state) => Column(
                    children: [
                      OrderSummaryShow(products: state.products),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Price',
                            style: AppTextStyle.font20BlackMedium,
                          ),
                          Text(
                            '\$${state.totalPrice.toStringAsFixed(2)}',
                            style: AppTextStyle.font20OrangeBaseMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),
                Center(
                  child: CustomButton(
                    onPressed: () => placeOrderPressed(context),
                    text: 'Place Order',
                    height: 38.h,
                    width: 157.43.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderSummaryShow extends StatelessWidget {
  final List<CartProduct> products;
  const OrderSummaryShow({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) => OrderCard(product: products[index]),
    );
  }
}

class OrderCard extends StatelessWidget {
  final CartProduct product;
  const OrderCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(10),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: Image.network(
                  product.productImage,
                  width: 71.68.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 71.68.w,
                    color: AppColors.orangeBase.withValues(alpha: 0.1),
                    child: const Icon(Icons.fastfood_outlined),
                  ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.font20BlackMedium.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '\$${product.totalItemPrice.toStringAsFixed(2)}',
                          style: AppTextStyle.font20OrangeBaseMedium,
                        ),
                      ],
                    ),
                    verticalSpace(4),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        '${product.quantity} items',
                        style: AppTextStyle.font16BlackLight,
                      ),
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => context
                            .read<CheckoutCubit>()
                            .cancelItem(product.id),
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.orangeBase.withValues(
                            alpha: 0.2,
                          ),
                          foregroundColor: AppColors.orangeBase,
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          'Remove',
                          style: AppTextStyle.font16BOrangeBaseMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(10),
        Divider(color: AppColors.orangeTwo, thickness: 1),
      ],
    );
  }
}
