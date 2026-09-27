import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 5.w,
      decoration: const BoxDecoration(
        color: AppColors.orangeBase,
        shape: BoxShape.circle,
      ),
    );
  }
}
