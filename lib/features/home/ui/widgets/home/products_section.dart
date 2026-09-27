import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yumquick/core/helper/helpers_functions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/rating_badge.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';
import 'package:yumquick/features/home/logic/home/home_state.dart';

class BlocBuilderProductsByCategoriesId extends StatelessWidget {
  const BlocBuilderProductsByCategoriesId({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.productsByCategoryStatus) {
          case HomeStatus.loading:
            return SizedBox(
              height: 50.h,
              child: Center(
                child: SpinKitDualRing(color: AppColors.yellowBase, size: 30.0),
              ),
            );
          case HomeStatus.isloadingmore:
            return Column(
              children: [
                ProductListView(products: state.productsByCategory),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Center(
                    child: SpinKitDualRing(
                      color: AppColors.orangeBase,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            );
          case HomeStatus.success:
            return ProductListView(products: state.productsByCategory);
          case HomeStatus.failure:
            return Center(
              child: Text(
                state.productsByCategoryError,
                style: TextStyle(color: Colors.red),
              ),
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}

class ProductListView extends StatelessWidget {
  final List<ProductsModel> products;
  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => navigateToProductDetailsScreen(context, products[index]),
          child: ProductListItem(product: products[index]),
        );
      },
    );
  }
}

class ProductListItem extends StatelessWidget {
  final ProductsModel product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Container(
          height: 174.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(36.r),
          ),
        ),
        verticalSpace(9),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.font18BlackSemiBold,
                    ),
                  ),
                  horizontalSpace(11),
                  Container(
                    height: 5.h,
                    width: 5.w,
                    decoration: BoxDecoration(
                      color: AppColors.orangeBase,
                      shape: BoxShape.circle,
                    ),
                  ),
                  horizontalSpace(11),
                  RatingBadge(rating: product.ratingAvg),
                ],
              ),
            ),
            horizontalSpace(8),
            Text(
              '\$${product.finalPrice.toStringAsFixed(2)}',
              style: AppTextStyle.font18BlackSemiBold.copyWith(
                color: AppColors.orangeBase,
              ),
            ),
          ],
        ),
        verticalSpace(4),

        Text(
          product.description ?? 'description not available',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.font12BlackLight,
        ),
        verticalSpace(18),
        Divider(color: AppColors.orangeTwo, thickness: 1.w),
        verticalSpace(18),
      ],
    );
  }
}
