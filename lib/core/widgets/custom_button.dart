import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textStyle;
  void Function()? onPressed;
  final String text;
  CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.width,
    this.radius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.orangeBase),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 100.r),
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(width ?? 133.w, height ?? 40.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle ?? AppTextStyle.font17WhiteMedium),
    );
  }
}
