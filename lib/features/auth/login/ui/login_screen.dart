import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_button.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/widgets/custom_textform.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userIdentifierController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  LoginScreen({super.key});

  void forgetPassword(BuildContext context) {
    Navigator.pushNamed(context, Routes.forgotPassword);
  }

  void signWithGoogle() {}
  void goToSignup(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.signup, (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(60),
            Text("Log In", style: AppTextStyle.font28WhiteBold),
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
                      Text("Welcome", style: AppTextStyle.font24BlackSemiBold),
                      verticalSpace(15),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua. ",
                        style: AppTextStyle.font14BlackLight,
                      ),
                      verticalSpace(40),
                      Text(
                        "Email or Mobile Number",
                        style: AppTextStyle.font20BlackMedium,
                      ),
                      verticalSpace(10),
                      CustomTextForm(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter your email or mobile number';
                          }
                          final emailRegex = RegExp(
                            r'^[\w.\-]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                          if (!emailRegex.hasMatch(val) &&
                              !phoneRegex.hasMatch(val)) {
                            return 'Enter a valid email or mobile number';
                          }
                          return null;
                        },
                        controller: userIdentifierController,
                        hint: "example@example.com",
                        isObsecure: false,
                      ),
                      verticalSpace(15),
                      Text("Password", style: AppTextStyle.font20BlackMedium),
                      verticalSpace(10),
                      CustomTextForm(
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter your password';
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
                      verticalSpace(14),
                      Align(
                        alignment: AlignmentGeometry.centerEnd,
                        child: TextButton(
                          onPressed: () => forgetPassword(context),
                          child: Text(
                            textAlign: TextAlign.end,
                            "forget password",
                            style: AppTextStyle.font14OrangeBaseMedium,
                          ),
                        ),
                      ),
                      verticalSpace(20),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  debugPrint('done');
                                }
                              },
                              text: "Log In",
                              width: 207.w,
                              height: 45.h,
                              textStyle: AppTextStyle.font24WhiteMedium,
                            ),
                            verticalSpace(20),
                            Text(
                              "or sign up with",
                              style: AppTextStyle.font14BlackLight,
                            ),
                            verticalSpace(10),
                            GestureDetector(
                              onTap: signWithGoogle,
                              child: Container(
                                padding: EdgeInsets.all(7.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.r),
                                  color: AppColors.orangeTwo,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/Gmail.svg',
                                ),
                              ),
                            ),
                            verticalSpace(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: AppTextStyle.font14BlackLight,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 2.w,
                                    ),
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () => goToSignup(context),
                                  child: Text(
                                    'Sign Up',
                                    style: AppTextStyle.font14OrangeBaseLight,
                                  ),
                                ),
                              ],
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
