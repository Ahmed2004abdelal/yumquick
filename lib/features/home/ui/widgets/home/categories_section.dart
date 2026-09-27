import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yumquick/features/home/data/models/categories_model.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';
import 'package:yumquick/features/home/logic/home/home_state.dart';

import '../../../../../core/helper/spacer.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';

class CategoriesShow extends StatelessWidget {
  final List<CategoriesModel> categories;
  const CategoriesShow({super.key, required this.categories});

  void selectCategories(BuildContext context, int categoryId) {
    final currentCategoryId = context.read<HomeCubit>().state.categoryId;
    if (currentCategoryId == categoryId) {
      context.read<HomeCubit>().resetCategoryId();
    } else {
      context.read<HomeCubit>().getProductByCategory(categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      child: Row(
        spacing: 19.w,
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () => selectCategories(context, categories[index].id),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellowTwo,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    children: [
                      (categories.isNotEmpty)
                          ? Image.network(
                              categories[index].iconUrl,
                              width: 32.81.w,
                              height: 37.h,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return SizedBox(
                                      width: 32.81.w,
                                      height: 37.h,
                                      child: SpinKitDualRing(
                                        color: AppColors.orangeBase,
                                        size: 20.0,
                                      ),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            )
                          : SizedBox(
                              width: 32.81.w,
                              height: 37.h,
                              child: SpinKitDualRing(
                                color: AppColors.yellowBase,
                                size: 20.0,
                              ),
                            ),
                    ],
                  ),
                ),
                verticalSpace(4),
                Text(
                  categories[index].name,
                  style: AppTextStyle.font12BlackRegular,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class BlocBuilderCategories extends StatelessWidget {
  const BlocBuilderCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.categoriesStatus) {
          case HomeStatus.loading:
            return SizedBox(
              height: 50.h,
              child: Center(
                child: SpinKitDualRing(color: AppColors.yellowBase, size: 30.0),
              ),
            );
          case HomeStatus.success:
            return CategoriesShow(categories: state.categories);
          case HomeStatus.failure:
            return Center(
              child: Text(
                state.categoriesError,
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
