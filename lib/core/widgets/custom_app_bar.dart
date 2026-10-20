import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 25.w, end: 25.w, top: 42.h),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            showBackButton
                ? Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        size: 30.w,
                        color: AppColors.orangeBase,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Text(title, style: AppTextStyle.font28WhiteBold),
          ],
        ),
      ),
    );
  }
}
