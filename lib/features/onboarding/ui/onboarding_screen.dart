import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/features/auth/login/ui/login_screen.dart';
import 'package:yumquick/features/onboarding/data/onboarding_model.dart';

import '../../../core/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  void changeOnboardingPage(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: onboardingData.length,
            controller: _pageController,
            onPageChanged: changeOnboardingPage,
            itemBuilder: (context, index) {
              return Onboarding_page_view(
                index: index,
                pageController: _pageController,
              );
            },
          ),
          Positioned(
            bottom: 130.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingData.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  width: index == _currentIndex ? 28.w : 20.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: index == _currentIndex
                        ? AppColors.orangeBase
                        : AppColors.yellowTwo,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class Onboarding_page_view extends StatefulWidget {
  final int index;
  final PageController _pageController;
  const Onboarding_page_view({
    super.key,
    required this.index,
    required this._pageController,
  });

  @override
  State<Onboarding_page_view> createState() => _Onboarding_page_viewState();
}

class _Onboarding_page_viewState extends State<Onboarding_page_view> {
  void skipOnboarding(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  void _nextPageButton() {
    if (widget.index == onboardingData.length - 1) {
      skipOnboarding(context);
    } else {
      widget._pageController.jumpToPage(widget.index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            onboardingData[widget.index].image ??
                'assets/images/first-boarding.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          verticalSpace(53.h),
          GestureDetector(
            onTap: () => skipOnboarding(context),
            child: Padding(
              padding: EdgeInsets.only(right: 37.0.w),
              child: Row(
                spacing: 7.w,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Skip', style: AppTextStyle.font15OrangeBaseSemiBold),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15.sp,
                    color: AppColors.orangeBase,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 338.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                verticalSpace(23.h),
                SvgPicture.asset(
                  onboardingData[widget.index].icon ??
                      'assets/icons/first-boarding-icon.svg',
                ),
                verticalSpace(20.h),
                Text(
                  onboardingData[widget.index].title ?? 'Title',
                  style: AppTextStyle.font24OrangeBaseBlack,
                ),
                verticalSpace(19.h),
                Text(
                  onboardingData[widget.index].description ?? 'Description',
                  style: AppTextStyle.font14BlackMedium,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(31.h),
                verticalSpace(32.h),
                CustomButton(onPressed: _nextPageButton, text: 'Next'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
