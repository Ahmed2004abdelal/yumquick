import 'package:flutter/material.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(title: "My Orders", showBackButton: false),
      ),
      body: Container(),
    );
  }
}
