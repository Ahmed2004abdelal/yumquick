import 'package:flutter/material.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';

class SideMenuModel {
  final String title;
  final String icon;
  final void Function(BuildContext context)? onTap;

  SideMenuModel({required this.title, required this.icon, this.onTap});
}

List<SideMenuModel> sideMenuItems = [
  SideMenuModel(title: "My Profile", icon: "assets/icons/profile-icon.svg"),
  SideMenuModel(
    title: "Delivery Address",
    icon: "assets/icons/location-icon.svg",
    onTap: (context) {
      context.pushNamed(Routes.addressScreen);
    },
  ),
  SideMenuModel(
    title: "Payment Methods",
    icon: "assets/icons/payment-icon.svg",
    onTap: (context) {
      context.pushNamed(Routes.paymentMethodsScreen);
    },
  ),
  SideMenuModel(title: "Contact Us", icon: "assets/icons/contact-icon.svg"),
  SideMenuModel(title: "Help & FAQs", icon: "assets/icons/FAQs-icon.svg"),
  SideMenuModel(title: "Settings", icon: "assets/icons/settings-icon.svg"),
];
