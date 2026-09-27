import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

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
            // hasScrollBody: false,
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
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Photo Pizza.png',
                            width: 158.w,
                            height: 141.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SliverGrid.builder(
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     mainAxisSpacing: 20.h,
                  //     crossAxisSpacing: 20.w,
                  //     childAspectRatio: 0.8,
                  //   ),
                  //   itemBuilder: (context,index){
                  //     return
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
