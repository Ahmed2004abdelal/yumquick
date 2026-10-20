import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/theme/font_weight_helper.dart';
import 'package:yumquick/core/widgets/product_price.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';
import 'package:yumquick/features/home/logic/home/home_state.dart';
import 'package:yumquick/features/home/ui/widgets/home/banners_section.dart';
import 'package:yumquick/features/home/ui/widgets/home/categories_section.dart';
import 'package:yumquick/features/home/ui/widgets/home/products_section.dart';
import 'package:yumquick/features/home/ui/widgets/home/recommend_section.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 31.h, start: 33.w, end: 33.w),
      width: double.infinity,
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
          BlocBuilderCategories(),
          verticalSpace(14),
          Divider(color: AppColors.orangeTwo, thickness: 1.w),
          verticalSpace(14),
          BlocBuilderHome(),
        ],
      ),
    );
  }
}

class BlocBuilderHome extends StatelessWidget {
  const BlocBuilderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.categoryId != current.categoryId,
      builder: (context, state) {
        return state.categoryId != 0
            ? BlocBuilderProductsByCategoriesId()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Seller",
                        style: AppTextStyle.font20BlackMedium,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              textAlign: TextAlign.justify,
                              "View All",
                              style: AppTextStyle.font12OrangeBaseSemiBold,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 3.h),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 11.w,
                                color: AppColors.orangeBase,
                                fontWeight: FontWeightHelper.extraBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(14),
                  BestSeller(),
                  verticalSpace(20),
                  BlocBuilderBanners(),
                  verticalSpace(21),
                  Text("Recommend", style: AppTextStyle.font20BlackMedium),
                  BlocBuilderRecommend(),
                ],
              );
      },
    );
  }
}

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 11.32.w,
      children: List.generate(4, (index) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 108.h,
              width: 72.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/first-boarding.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(19.12.r),
              ),
            ),
            PositionedDirectional(
              bottom: 12.h,
              end: -2.w,
              child: ProductPrice(price: 130),
            ),
          ],
        );
      }),
    );
  }
}
