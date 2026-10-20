import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';

class SelectionDot extends StatelessWidget {
  final bool isSelected;
  const SelectionDot({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.orangeBase, width: 1.2),
      ),
      alignment: Alignment.center,
      child: Container(
        height: 13.h,
        width: 13.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: AppColors.orangeBase,
          border: Border.all(color: AppColors.orangeBase, width: 1.2),
        ),
        child: AnimatedScale(
          scale: isSelected ? 1 : 0,
          duration: const Duration(milliseconds: 150),
          child: Container(
            height: 13.h,
            width: 13.w,
            decoration: const BoxDecoration(
              color: AppColors.orangeBase,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
