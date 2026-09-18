import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/features/auth/signup/logic/signup_cubit.dart';
import 'package:yumquick/features/auth/signup/logic/signup_state.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/widgets/custom_textform.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  void signWithGoogle() {}
  void goToLogIn(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.login, (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: CustomScrollView(
        slivers: [
          // الهيدر: المسافة + العنوان
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(60),
                Text("New Account", style: AppTextStyle.font28WhiteBold),
                verticalSpace(35),
              ],
            ),
          ),

          // الفورم كامل كـ sliver واحد
          SliverToBoxAdapter(
            child: Form(
              key: context.read<SignupCubit>().formKey,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(36.w, 34.h, 36.w, 20.h),
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
                    Text("Full name", style: AppTextStyle.font20BlackMedium),
                    verticalSpace(8),
                    CustomTextForm(
                      autofocus: true,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (val.trim().length < 3) {
                          return 'Name must be at least 3 characters';
                        }
                        return null;
                      },
                      controller: context.read<SignupCubit>().nameController,
                      hint: "enter your name",
                      isObsecure: false,
                    ),
                    verticalSpace(11),
                    Text("Email", style: AppTextStyle.font20BlackMedium),
                    verticalSpace(8),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(
                          r'^[\w.\-]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(val)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      controller: context.read<SignupCubit>().emailController,
                      hint: "example@example.com",
                      isObsecure: false,
                    ),
                    verticalSpace(11),
                    Text(
                      "Mobile Number",
                      style: AppTextStyle.font20BlackMedium,
                    ),
                    verticalSpace(8),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                        if (!phoneRegex.hasMatch(val)) {
                          return 'Enter a valid mobile number';
                        }
                        return null;
                      },
                      controller: context.read<SignupCubit>().mobileController,
                      hint: "+ 123 456 789",
                      isObsecure: false,
                    ),
                    verticalSpace(11),
                    Text("Password", style: AppTextStyle.font20BlackMedium),
                    verticalSpace(8),
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
                      controller: context
                          .read<SignupCubit>()
                          .passwordController,
                      hint: "*************",
                      isObsecure: true,
                    ),
                    verticalSpace(11),
                    Text(
                      "Confirm Password",
                      style: AppTextStyle.font20BlackMedium,
                    ),
                    verticalSpace(8),
                    CustomTextForm(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (val !=
                            context
                                .read<SignupCubit>()
                                .passwordController
                                .text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      controller: context
                          .read<SignupCubit>()
                          .confirmPasswordController,
                      hint: "*************",
                      isObsecure: true,
                    ),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: AppTextStyle.font14BlackLight,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsetsDirectional.only(start: 2.w),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () => goToLogIn(context),
                          child: Text(
                            'Log In',
                            style: AppTextStyle.font14OrangeBaseLight,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(5),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SignupBlocBuilder(),
                          SignupBlocConsumer(),
                          verticalSpace(9),
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
                              child: SvgPicture.asset('assets/icons/Gmail.svg'),
                            ),
                          ),
                          verticalSpace(5),
                          Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'By continuing, you agree to ',
                                    style: AppTextStyle.font12BlackLight,
                                  ),
                                  TextSpan(
                                    text: '\nTerms of Use ',
                                    style: AppTextStyle.font12OrangeBaseMedium,
                                  ),
                                  TextSpan(
                                    text: 'and ',
                                    style: AppTextStyle.font12BlackLight,
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy.',
                                    style: AppTextStyle.font12OrangeBaseMedium,
                                  ),
                                ],
                              ),
                            ),
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
    );
  }
}

class SignupBlocConsumer extends StatelessWidget {
  const SignupBlocConsumer({super.key});

  void signupPressed(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
          signError: (errorHandler) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorHandler)));
          },
          signSuccess: (data) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (r) => false,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return CustomButton(
              onPressed: () => signupPressed(context),
              text: "Sign Up",
              width: 207.w,
              height: 45.h,
              textStyle: AppTextStyle.font24WhiteMedium,
            );
          },
          signLoading: () {
            return Container(
              width: 207.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: AppColors.yellowBase,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Center(
                child: SpinKitFoldingCube(color: Colors.white, size: 20.w),
              ),
            );
          },
        );
      },
    );
  }
}
