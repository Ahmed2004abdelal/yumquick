import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 25.w, end: 25.w, top: 42.h),
      child: Row(
        spacing: 35.w,
        children: [
          IconButton(
            color: AppColors.orangeBase,
            icon: Icon(
              Icons.chevron_left_rounded,
              size: 30.w,
              color: AppColors.orangeBase,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Center(child: Text(title, style: AppTextStyle.font28WhiteBold)),
        ],
      ),
    );
  }
}
