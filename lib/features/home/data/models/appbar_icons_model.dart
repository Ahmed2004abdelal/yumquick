import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';

class AppbarIconsModel {
  final String icon;
  final void Function(BuildContext context)? onPressed;

  AppbarIconsModel({required this.icon, this.onPressed});
}

List<AppbarIconsModel> appbarIconsList = [
  AppbarIconsModel(
    icon: "assets/icons/cart-icon.svg",
    onPressed: (context) {
      log("Cart icon pressed");
      context.pushNamed(Routes.cart);
    },
  ),
  AppbarIconsModel(icon: "assets/icons/notification-icon.svg"),
  AppbarIconsModel(
    icon: "assets/icons/profile-icon.svg",
    onPressed: (context) {
      log("Profile icon pressed");
      Scaffold.of(context).openEndDrawer();
    },
  ),
];
