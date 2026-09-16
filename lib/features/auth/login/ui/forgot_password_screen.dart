import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_button.dart';

import '../../../../core/widgets/custom_textform.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(60),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.orangeBase,
                    size: 20,
                  ),
                ),
                horizontalSpace(72),
                Text("Set Password", style: AppTextStyle.font28WhiteBold),
              ],
            ),
            verticalSpace(35),
            Expanded(
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(36.w, 34.h, 36.w, 0.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua. ",
                        style: AppTextStyle.font14BlackLight,
                      ),
                      verticalSpace(40),
                      Text("Password", style: AppTextStyle.font20BlackMedium),
                      verticalSpace(10),
                      CustomTextForm(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (val.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        controller: passwordController,
                        hint: "*************",
                        isObsecure: true,
                      ),
                      verticalSpace(31),
                      Text(
                        "Confirm Password",
                        style: AppTextStyle.font20BlackMedium,
                      ),
                      verticalSpace(10),
                      CustomTextForm(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (val != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        controller: confirmPasswordController, // ← بدل TextEditingController() الفاضية
                        hint: "*************",
                        isObsecure: true,
                      ),
                      verticalSpace(57),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButton(
                              onPressed: () {},
                              text: "Create New Password",
                              width: 198.w,
                              height: 36.h,
                              textStyle: AppTextStyle.font17WhiteMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
