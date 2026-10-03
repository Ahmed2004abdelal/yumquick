// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:yumquick/core/helper/spacer.dart';
// import 'package:yumquick/core/theme/app_colors.dart';
// import 'package:yumquick/core/theme/app_text_style.dart';
// import 'package:yumquick/core/widgets/favorite_icon.dart';
// import 'package:yumquick/features/favorites/logic/favorites_cubit.dart';
// import 'package:yumquick/features/favorites/logic/favorites_state.dart';
// import 'package:yumquick/features/home/data/models/products_model.dart';

// class FavoritesScreen extends StatelessWidget {
//   FavoritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.yellowBase,
//       body: CustomScrollView(
//         controller: context.read<FavoritesCubit>().sliverController,
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 129.h,
//             toolbarHeight: 60.h,
//             backgroundColor: AppColors.yellowBase,
//             automaticallyImplyLeading: false,
//             flexibleSpace: Container(
//               color: AppColors.yellowBase,
//               alignment: Alignment.center,
//               padding: EdgeInsets.only(top: 46.h),
//               child: Text('Favorites', style: AppTextStyle.font28WhiteBold),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               padding: EdgeInsetsDirectional.only(
//                 top: 34.h,
//                 start: 35.w,
//                 end: 35.w,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30.r),
//                   topRight: Radius.circular(30.r),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'It\'s time to buy your favorite dish.',
//                     style: AppTextStyle.font18OrangeBaseMedium,
//                   ),

//                   verticalSpace(20.h),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BlocBuilderFavorites extends StatelessWidget {
//   const BlocBuilderFavorites({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FavoritesCubit, FavoritesState>(
//       builder: (context, state) {
//         if (state.favoriteStatus == FavoritesStatus.success) {
//           return GridView.builder(
//             controller: context.read<FavoritesCubit>().gridViewController,
//             primary: false,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: state.favoriteProducts.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 7.h,
//               crossAxisSpacing: 7.w,
//               childAspectRatio: 0.7,
//             ),
//             itemBuilder: (context, index) {
//               return FavoritesProductsShow(
//                 favProduct: state.favoriteProducts[index],
//               );
//             },
//           );
//         } else if (state.favoriteStatus == FavoritesStatus.failure) {
//           return Center(
//             child: Text(
//               state.favoriteErrorMessage,
//               style: AppTextStyle.font24RedBlack,
//             ),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(color: AppColors.orangeBase),
//           );
//         }
//       },
//     );
//   }
// }

// class FavoritesProductsShow extends StatelessWidget {
//   final ProductsModel favProduct;

//   const FavoritesProductsShow({super.key, required this.favProduct});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 158.w,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsetsDirectional.symmetric(
//               horizontal: 9.w,
//               vertical: 8.h,
//             ),
//             width: 158.w,
//             height: 141.h,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(favProduct.imageUrl),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: BorderRadius.circular(20.r),
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [FavoriteIcon()],
//             ),
//           ),
//           verticalSpace(13.h),
//           Text(favProduct.name, style: AppTextStyle.font16BOrangeBaseMedium),
//           Text(
//             favProduct.description ??
//                 "Lorem ipsum dolor sit amet, consectetur.",
//             textAlign: TextAlign.center,
//             style: AppTextStyle.font12BlackLight,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/favorite_icon.dart';
import 'package:yumquick/features/favorites/logic/favorites_cubit.dart';
import 'package:yumquick/features/favorites/logic/favorites_state.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 129.h,
            toolbarHeight: 60.h,
            backgroundColor: AppColors.yellowBase,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              color: AppColors.yellowBase,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 46.h),
              child: Text('Favorites', style: AppTextStyle.font28WhiteBold),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsetsDirectional.only(
                top: 34.h,
                start: 35.w,
                end: 35.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'It\'s time to buy your favorite dish.',
                    style: AppTextStyle.font18OrangeBaseMedium,
                  ),
                  verticalSpace(24.h),
                  BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (context, state) {
                      return switch (state.favoriteStatus) {
                        FavoritesStatus.initial ||
                        FavoritesStatus.loading => const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        FavoritesStatus.failure => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Center(
                            child: Text(state.favoriteErrorMessage),
                          ),
                        ),
                        FavoritesStatus.success =>
                          state.favoriteProducts.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 40),
                                  child: Center(
                                    child: Text('No favorites yet'),
                                  ),
                                )
                              : GridView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.favoriteProducts.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 7.h,
                                        crossAxisSpacing: 7.w,
                                        childAspectRatio: 0.7,
                                      ),
                                  itemBuilder: (context, index) {
                                    final product =
                                        state.favoriteProducts[index];
                                    return FavoritesProductsShow(
                                      product: product,
                                    );
                                  },
                                ),
                      };
                    },
                  ),
                  verticalSpace(20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesProductsShow extends StatelessWidget {
  final ProductsModel product;

  const FavoritesProductsShow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 158.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 9.w,
              vertical: 8.h,
            ),
            width: 158.w,
            height: 141.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [FavoriteIcon()],
            ),
          ),
          verticalSpace(13.h),
          Text(product.name, style: AppTextStyle.font16BOrangeBaseMedium),
          Text(
            product.description ??
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            textAlign: TextAlign.center,
            style: AppTextStyle.font12BlackLight,
          ),
        ],
      ),
    );
  }
}
