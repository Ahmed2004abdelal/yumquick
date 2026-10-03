import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';

class FavoriteIcon extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;

  const FavoriteIcon({super.key, this.backgroundColor, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12.r,
      backgroundColor: backgroundColor ?? Colors.white,
      child: Icon(
        Icons.favorite,
        color: iconColor ?? AppColors.orangeBase,
        size: 16.w,
      ),
    );
  }
}

// CircleAvatar(
//                 radius: 12.r,
//                 backgroundColor: isFavorite
//                     ? Colors.white
//                     : AppColors.orangeBase,
//                 child: Icon(
//                   Icons.favorite,
//                   color: isFavorite ? AppColors.orangeBase : Colors.white,
//                   size: 16.w,
//                 ),
//               ),
