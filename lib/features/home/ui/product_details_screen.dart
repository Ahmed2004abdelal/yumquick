import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/helpers_functions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/custom_dot.dart';
import 'package:yumquick/core/widgets/rating_badge.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';
import 'package:yumquick/features/home/data/models/toppings_model.dart';
import 'package:yumquick/features/home/logic/product%20details/product_details_cubit.dart';
import 'package:yumquick/features/home/logic/product%20details/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ProductDetailsView();
  }
}

class _ProductDetailsView extends StatelessWidget {
  const _ProductDetailsView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: SafeArea(
        bottom: false,
        child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listenWhen: (previous, current) =>
              previous.addToCartStatus != current.addToCartStatus,
          listener: (context, state) {
            if (state.addToCartStatus == ProductDetailsStatus.success) {
              showSnack(
                context,
                "${cubit.product.name} added to cart",
                AppColors.font,
              );
            } else if (state.addToCartStatus == ProductDetailsStatus.failure) {
              showSnack(
                context,
                state.addToCartErrorMessage.isNotEmpty
                    ? state.addToCartErrorMessage
                    : "Couldn't add ${cubit.product.name} to cart",
                Colors.red,
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(33.w, 8.h, 33.w, 0),
                  child: _ProductHeader(
                    product: cubit.product,
                    isFavorite: state.isFavorite,
                    onBack: () => context.pop(),
                    onToggleFavorite: cubit.toggleFavorite,
                  ),
                ),
                verticalSpace(12),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsetsDirectional.fromSTEB(
                              33.w,
                              20.h,
                              33.w,
                              0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _ProductImage(imageUrl: cubit.product.imageUrl),
                                verticalSpace(16),
                                _PriceAndQuantity(
                                  price: state.price,
                                  quantity: state.amount,
                                  onIncrease: cubit.increaseAmount,
                                  onDecrease: cubit.decreaseAmount,
                                ),
                                verticalSpace(16),
                                Text(
                                  cubit.product.categoryName ?? 'category',
                                  style: AppTextStyle.font16BlackRegular,
                                ),
                                if (!cubit.product.description
                                    .isNullOrEmpty()) ...[
                                  verticalSpace(8),
                                  Text(
                                    cubit.product.description!,
                                    style: AppTextStyle.font16BlackLight,
                                  ),
                                ],
                                if (!cubit.product.toppings
                                    .isNullOrEmpty()) ...[
                                  verticalSpace(20),
                                  Text(
                                    "Toppings",
                                    style: AppTextStyle.font20BlackMedium,
                                  ),
                                  verticalSpace(4),
                                  _ToppingsList(
                                    toppings: cubit.product.toppings,
                                    selectedIds: state.selectedToppingIds,
                                    onToggle: cubit.toggleTopping,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            33.w,
                            16.h,
                            33.w,
                            20.h,
                          ),
                          child: Center(
                            child:
                                BlocBuilder<
                                  ProductDetailsCubit,
                                  ProductDetailsState
                                >(
                                  builder: (context, state) {
                                    if (state.addToCartStatus ==
                                        ProductDetailsStatus.loading) {
                                      return Container(
                                        width: 190.w,
                                        height: 44.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.orangeBase,
                                          borderRadius: BorderRadius.circular(
                                            100.r,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child: SpinKitFoldingCube(
                                            color: Colors.white,
                                            size: 20.w,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return CustomButton(
                                        text: "Add to Cart",
                                        width: 190.w,
                                        height: 44.h,
                                        icon: Icons.shopping_bag_outlined,
                                        onPressed:
                                            state.addToCartStatus ==
                                                ProductDetailsStatus.loading
                                            ? null
                                            : cubit.addToCart,
                                      );
                                    }
                                  },
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  final ProductsModel product;
  final bool isFavorite;
  final VoidCallback onBack;
  final VoidCallback onToggleFavorite;

  const _ProductHeader({
    required this.product,
    required this.isFavorite,
    required this.onBack,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listenWhen: (previous, current) =>
          previous.toggleFavoriteStatus != current.toggleFavoriteStatus,
      listener: (context, state) {
        if (state.toggleFavoriteStatus == ProductDetailsStatus.failure) {
          showSnack(
            context,
            state.toggleFavoriteErrorMessage.isNotEmpty
                ? state.toggleFavoriteErrorMessage
                : "Couldn't toggle favorite for ${product.name}",
            Colors.red,
          );
        }
        if (state.toggleFavoriteStatus == ProductDetailsStatus.success) {
          showSnack(
            context,
            isFavorite
                ? "${product.name} removed from favorites"
                : "${product.name} added to favorites",
            Colors.green,
          );
        }
      },
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onBack,
              behavior: HitTestBehavior.opaque,
              child: Icon(
                Icons.chevron_left_rounded,
                size: 30.w,
                color: AppColors.orangeBase,
              ),
            ),
            horizontalSpace(2),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(product.name, style: AppTextStyle.font20BlackMedium),
                      horizontalSpace(15),
                      CustomDot(),
                    ],
                  ),
                  verticalSpace(2),
                  RatingBadge(rating: product.ratingAvg),
                ],
              ),
            ),
            GestureDetector(
              onTap: onToggleFavorite,
              child: CircleAvatar(
                radius: 12.r,
                backgroundColor: isFavorite
                    ? Colors.white
                    : AppColors.orangeBase,
                child: Icon(
                  Icons.favorite,
                  color: isFavorite ? AppColors.orangeBase : Colors.white,
                  size: 16.w,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String imageUrl;
  const _ProductImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28.r),
      child: SizedBox(
        height: 250.h,
        width: double.infinity,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.orangeTwo,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood_rounded,
              size: 40.w,
              color: AppColors.orangeBase,
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceAndQuantity extends StatelessWidget {
  final double price;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _PriceAndQuantity({
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: AppTextStyle.font24OrangeBaseBlack,
            ),
            Row(
              children: [
                _QuantityButton(
                  icon: Icons.remove_rounded,
                  iconColor: quantity > 1 ? AppColors.font : Colors.grey,
                  backgroundColor: AppColors.orangeTwo,
                  onTap: onDecrease,
                ),
                SizedBox(
                  width: 30.w,
                  child: Text(
                    quantity.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.font16BlackSemiBold,
                  ),
                ),
                _QuantityButton(
                  icon: Icons.add_rounded,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.orangeBase,
                  onTap: onIncrease,
                ),
              ],
            ),
          ],
        ),
        Divider(color: AppColors.orangeTwo, thickness: 1.2.h, height: 20.h),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20.w, color: iconColor),
      ),
    );
  }
}

class _ToppingsList extends StatelessWidget {
  final List<ToppingsModel> toppings;
  final Set<int> selectedIds;
  final ValueChanged<int> onToggle;

  const _ToppingsList({
    required this.toppings,
    required this.selectedIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(toppings.length, (index) {
        final topping = toppings[index];
        final isSelected = selectedIds.contains(topping.id);

        return Padding(
          padding: EdgeInsetsDirectional.only(top: 12.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  topping.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.font16BlackLight,
                ),
              ),
              horizontalSpace(8),
              Text(
                '\$${topping.extraPrice.toStringAsFixed(2)}',
                style: AppTextStyle.font12BlackRegular,
              ),
              horizontalSpace(18),
              GestureDetector(
                onTap: () => onToggle(topping.id),
                child: _SelectionDot(isSelected: isSelected),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _SelectionDot extends StatelessWidget {
  final bool isSelected;
  const _SelectionDot({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.orangeBase, width: 1.2),
      ),
      alignment: Alignment.center,
      child: Container(
        height: 13.h,
        width: 13.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: AppColors.orangeBase,
          border: Border.all(color: AppColors.orangeBase, width: 1.2),
        ),
        child: AnimatedScale(
          scale: isSelected ? 1 : 0,
          duration: const Duration(milliseconds: 150),
          child: Container(
            height: 13.h,
            width: 13.w,
            decoration: const BoxDecoration(
              color: AppColors.orangeBase,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
