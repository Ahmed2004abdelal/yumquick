import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(title: 'Help Center'),
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
      ),
    );
  }
}
