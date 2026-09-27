import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  const ProductPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: AppColors.orangeBase,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(30.r),
          bottomStart: Radius.circular(30.r),
        ),
      ),
      child: Center(
        child: Text(
          "\$${price.toStringAsFixed(1)}",
          style: AppTextStyle.font12WhiteRegular,
        ),
      ),
    );
  }
}
