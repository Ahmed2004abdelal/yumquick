import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/spacer.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.width,
    this.radius,
    this.textStyle,
    this.icon,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppColors.orangeBase,
        ),
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
      child: icon == null
          ? Text(text, style: textStyle ?? AppTextStyle.font17WhiteMedium)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor ?? Colors.white, size: 19.w),
                horizontalSpace(8),
                Text(text, style: textStyle ?? AppTextStyle.font17WhiteMedium),
              ],
            ),
    );
  }
}
