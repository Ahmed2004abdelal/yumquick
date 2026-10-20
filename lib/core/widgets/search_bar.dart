import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_textform.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const CustomSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 200.w,
      child: CustomTextForm(
        fillColor: Colors.white,
        contentPadding: EdgeInsets.only(top: 8.h, bottom: 7.h, left: 12.w),
        controller: searchController,
        hint: 'Search',
        hintStyle: AppTextStyle.font15GreyLight,
        isObsecure: false,
        validator: (val) => null,
        suffixIcon: Container(
          height: 5.h,
          width: 10.w,
          padding: EdgeInsets.all(2.w),
          margin: EdgeInsetsDirectional.only(
            end: 4.w,
            top: 3.h,
            bottom: 3.h,
            start: 20.w,
          ),

          decoration: BoxDecoration(
            color: AppColors.orangeBase,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: SvgPicture.asset(
            "assets/icons/filter-icon.svg",
            // fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
