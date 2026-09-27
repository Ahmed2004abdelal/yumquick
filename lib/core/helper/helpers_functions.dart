import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

import '../../features/home/data/models/products_model.dart';

String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    return "Good Morning";
  } else if (hour >= 12 && hour < 17) {
    return "Good Afternoon";
  } else if (hour >= 17 && hour < 21) {
    return "Good Evening";
  } else {
    return "Good Night";
  }
}

String getTitle(String text) {
  final match = RegExp(r'\d+%').firstMatch(text);
  return match == null ? text : text.substring(0, match.start).trim();
}

String getOffer(String text) {
  final match = RegExp(r'\d+%').firstMatch(text);
  return match == null ? '' : text.substring(match.start).trim();
}

void navigateToProductDetailsScreen(
  BuildContext context,
  ProductsModel product,
) {
  context.pushNamed(Routes.productDetails, arguments: product);
}

void showSnack(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyle.font14BlackMedium.copyWith(color: Colors.white),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
}
