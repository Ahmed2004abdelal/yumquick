import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/helpers_functions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/features/cart/data/models/get_cart_model.dart';
import 'package:yumquick/features/cart/logic/cart_cubit.dart';
import 'package:yumquick/features/cart/logic/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CartView();
  }
}

class _CartView extends StatelessWidget {
  const _CartView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: SafeArea(
        bottom: false,
        child: BlocConsumer<CartCubit, CartState>(
          listenWhen: (previous, current) =>
              previous.actionStatus != current.actionStatus,
          listener: (context, state) {
            if (state.actionStatus == CartStatus.failure) {
              showSnack(
                context,
                state.actionError.isNotEmpty
                    ? state.actionError
                    : "Something went wrong",
                Colors.red,
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                _CartAppBar(itemCount: state.itemCount),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    child: _buildBody(context, state),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CartState state) {
    if (state.status == CartStatus.loading) {
      return const _CartLoadingState();
    }
    if (state.status == CartStatus.failure) {
      return _CartErrorState(
        message: state.error,
        onRetry: () => context.read<CartCubit>().getCart(),
      );
    }
    if (state.cartItems.isEmpty) {
      return const _EmptyCartState();
    }
    return _CartItemsList(cartItems: state.cartItems);
  }
}

class _CartAppBar extends StatelessWidget {
  final int itemCount;
  const _CartAppBar({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(33.w, 16.h, 33.w, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.chevron_left_rounded,
              size: 30.w,
              color: AppColors.orangeBase,
            ),
          ),
          horizontalSpace(12),
          Text('My Cart', style: AppTextStyle.font24BlackSemiBold),
          const Spacer(),
          if (itemCount > 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.orangeTwo,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Text(
                '$itemCount items',
                style: AppTextStyle.font12OrangeBaseSemiBold,
              ),
            ),
        ],
      ),
    );
  }
}

class _CartLoadingState extends StatelessWidget {
  const _CartLoadingState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFoldingCube(color: AppColors.orangeBase, size: 40.w),
          verticalSpace(16),
          Text('Loading your cart...', style: AppTextStyle.font16BlackLight),
        ],
      ),
    );
  }
}

class _CartErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _CartErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 60.w,
              color: AppColors.orangeBase,
            ),
            verticalSpace(16),
            Text(
              'Oops! Something went wrong',
              style: AppTextStyle.font20BlackMedium,
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text(
              message,
              style: AppTextStyle.font14BlackLight,
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            CustomButton(
              text: 'Try Again',
              width: 150.w,
              height: 44.h,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyCartState extends StatelessWidget {
  const _EmptyCartState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                color: AppColors.orangeTwo,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 50.w,
                color: AppColors.orangeBase,
              ),
            ),
            verticalSpace(24),
            Text('Your cart is empty', style: AppTextStyle.font24BlackSemiBold),
            verticalSpace(8),
            Text(
              'Looks like you haven\'t added anything to your cart yet. Browse our menu and find something delicious!',
              style: AppTextStyle.font14BlackLight,
              textAlign: TextAlign.center,
            ),
            verticalSpace(32),
            CustomButton(
              text: 'Browse Menu',
              width: 190.w,
              height: 48.h,
              icon: Icons.restaurant_outlined,
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartItemsList extends StatelessWidget {
  final List<CartProduct> cartItems;

  const _CartItemsList({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    final isLoading = context.select<CartCubit, bool>(
      (c) => c.state.actionStatus == CartStatus.loading,
    );

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsetsDirectional.fromSTEB(33.w, 24.h, 33.w, 0),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => verticalSpace(16),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _CartItemCard(
                item: item,
                isLoading: isLoading,
                onRemove: () => cubit.removeItem(item.id),
              );
            },
          ),
        ),
        _OrderSummary(cartItems: cartItems, isLoading: isLoading),
      ],
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartProduct item;
  final bool isLoading;
  final VoidCallback onRemove;

  const _CartItemCard({
    required this.item,
    required this.isLoading,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
          size: 28.w,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.orangeTwo.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductImage(imageUrl: item.productImage),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.productName,
                          style: AppTextStyle.font16BlackSemiBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      horizontalSpace(8),
                      GestureDetector(
                        onTap: isLoading ? null : onRemove,
                        behavior: HitTestBehavior.opaque,
                        child: Icon(
                          Icons.close_rounded,
                          size: 20.w,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(4),
                  if (item.selectedVariants.isNotEmpty)
                    Text(
                      item.selectedVariants.map((v) => v.name).join(', '),
                      style: AppTextStyle.font12GreyLight,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${item.totalItemPrice.toStringAsFixed(2)}',
                        style: AppTextStyle.font18BlackSemiBold.copyWith(
                          color: AppColors.orangeBase,
                        ),
                      ),
                      Spacer(),
                      // horizontalSpace(70),
                      Container(
                        // height: 24.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          // vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.orangeTwo,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Text(
                          'x${item.quantity}',
                          style: AppTextStyle.font16BlackRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String imageUrl;
  const _ProductImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        width: 80.w,
        height: 80.w,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.orangeTwo,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood_rounded,
              size: 30.w,
              color: AppColors.orangeBase,
            ),
          ),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: AppColors.orangeTwo,
              alignment: Alignment.center,
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.orangeBase,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  final List<CartProduct> cartItems;
  final bool isLoading;

  const _OrderSummary({required this.cartItems, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    // final subtotal = cartItems.fold<double>(
    //   0.0,
    //   (sum, item) => sum + item.totalItemPrice,
    // );
    // const deliveryFee = 2.0;
    // final total = subtotal + deliveryFee;

    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(33.w, 20.h, 33.w, 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('Order Summary', style: AppTextStyle.font20BlackMedium),
            ],
          ),
          verticalSpace(16),
          _SummaryRow(
            label: 'Subtotal',
            value:
                '\$${context.read<CartCubit>().state.totalPrice.toStringAsFixed(2)}',
          ),
          // verticalSpace(8),
          // _SummaryRow(
          //   label: 'Delivery Fee',
          //   value: '\$${deliveryFee.toStringAsFixed(2)}',
          // ),
          verticalSpace(12),
          Divider(color: AppColors.orangeTwo, thickness: 1.2.h),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppTextStyle.font18BlackSemiBold),
              Text(
                '\$${context.read<CartCubit>().state.totalPrice.toStringAsFixed(2)}',
                style: AppTextStyle.font24OrangeBaseBlack,
              ),
            ],
          ),
          verticalSpace(20),
          CustomButton(
            text: 'Proceed to Checkout',
            width: double.infinity,
            height: 52.h,
            icon: Icons.arrow_forward_rounded,
            onPressed: isLoading
                ? null
                : () {
                    showSnack(
                      context,
                      'Checkout is not available yet',
                      AppColors.font,
                    );
                  },
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyle.font15GreyLight),
        Text(value, style: AppTextStyle.font16BlackRegular),
      ],
    );
  }
}
