import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/helpers_functions.dart';
import '../../../../../core/helper/spacer.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/widgets/search_bar.dart';
import '../../../data/models/appbar_icons_model.dart';

class HomeAppBar extends StatelessWidget {
  final TextEditingController searchController;
  const HomeAppBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      automaticallyImplyActions: false,
      backgroundColor: AppColors.yellowBase,
      toolbarHeight: 161.h,
      flexibleSpace: Container(
        padding: EdgeInsetsDirectional.only(top: 62.h, start: 33.w, end: 33.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomSearchBar(searchController: searchController),
                horizontalSpace(29),
                _AppBarIcons(),
              ],
            ),
            verticalSpace(16),
            _GreetingSection(),
          ],
        ),
      ),
    );
  }
}

class _AppBarIcons extends StatelessWidget {
  const _AppBarIcons();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 7.w,
      children: appbarIconsList.map((icon) {
        return GestureDetector(
          onTap: icon.onPressed != null ? () => icon.onPressed!(context) : null,
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            height: 26.h,
            width: 26.w,
            child: GestureDetector(
              onTap: icon.onPressed != null
                  ? () => icon.onPressed!(context)
                  : null,
              child: SvgPicture.asset(icon.icon, fit: BoxFit.scaleDown),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _GreetingSection extends StatelessWidget {
  const _GreetingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(getGreeting(), style: AppTextStyle.font30WhiteBold),
        Text(
          'Rise and shine! It\'s breakfast time',
          style: AppTextStyle.font13OrangeBaseMedium,
        ),
      ],
    );
  }
}
