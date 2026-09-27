import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/product_price.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';
import 'package:yumquick/features/home/logic/home/home_state.dart';

import '../../../../../core/helper/helpers_functions.dart';
import '../../../../../core/theme/app_colors.dart';

class RecommendShow extends StatelessWidget {
  final List<ProductsModel> recommend;
  const RecommendShow({super.key, required this.recommend});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recommend.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final item = recommend[index];
        final hasDiscount = item.discountPercent > 0;

        return GestureDetector(
          onTap: () => navigateToProductDetailsScreen(context, item),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: AppColors.yellowTwo,
                        child: Center(
                          child: SpinKitDualRing(
                            color: AppColors.orangeBase,
                            size: 24.0,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.yellowTwo,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
                ),
              ),

              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.55),
                      ],
                      stops: const [0.55, 1],
                    ),
                  ),
                ),
              ),

              PositionedDirectional(
                start: 12.w,
                bottom: 12.h,
                end: 60.w,
                child: Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.font12WhiteRegular,
                ),
              ),

              PositionedDirectional(
                bottom: 12.h,
                end: -2.w,
                child: ProductPrice(price: item.finalPrice),
              ),

              PositionedDirectional(
                top: 12.h,
                start: 12.w,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            item.ratingAvg.toStringAsFixed(1),
                            style: AppTextStyle.font12BlackRegular,
                          ),
                          horizontalSpace(5),
                          SvgPicture.asset(
                            "assets/icons/star-icon.svg",
                            width: 10.w,
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(5),
                    CircleAvatar(
                      radius: 9.r,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.orangeBase,
                        size: 12.w,
                      ),
                    ),
                  ],
                ),
              ),

              if (hasDiscount)
                PositionedDirectional(
                  top: 12.h,
                  end: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orangeBase,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      '-${item.discountPercent.toStringAsFixed(0)}%',
                      style: AppTextStyle.font12WhiteRegular,
                    ),
                  ),
                ),

              // badge "New"
              if (item.isNew)
                PositionedDirectional(
                  top: hasDiscount ? 36.h : 12.h,
                  end: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text('New', style: AppTextStyle.font12BlackRegular),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class BlocBuilderRecommend extends StatelessWidget {
  const BlocBuilderRecommend({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.recommendStatus) {
          case HomeStatus.loading:
            return SizedBox(
              height: 50.h,
              child: Center(
                child: SpinKitDualRing(color: AppColors.yellowBase, size: 30.0),
              ),
            );
          case HomeStatus.success:
            return RecommendShow(recommend: state.recommend);
          case HomeStatus.failure:
            return Center(
              child: Text(
                state.recommendError,
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
