import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/features/help/data/models/help_categories_model.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(showBackButton: false, title: 'Help'),
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
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              'If you have any questions or need assistance, please reach out to our support team.',
            ),
            verticalSpace(33.h),
            Divider(color: AppColors.orangeTwo, thickness: 1.5.h, height: 0),
            Column(
              children: List.generate(helpCategories.length, (index) {
                final item = helpCategories[index];
                return Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: item.onTap != null
                          ? () => item.onTap!(context)
                          : null,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: AppTextStyle.font20BlackMedium,
                                  ),
                                  Text(
                                    item.description,
                                    style: AppTextStyle.font14BlackLight,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.orangeBase,
                              size: 20.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.orangeTwo,
                      thickness: 1.5.h,
                      height: 0,
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
