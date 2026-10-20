import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/utils/models/side_menu_model.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';

import '../../../../../core/Routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  void logOut(BuildContext context) {
    context.pushNamedAndRemoveUntil(Routes.login, predicate: (routes) => false);
    context.read<HomeCubit>().logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 330.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(100.r),
          bottomStart: Radius.circular(100.r),
        ),
      ),
      backgroundColor: AppColors.orangeBase,
      elevation: 1,
      shadowColor: Colors.green,
      surfaceTintColor: Colors.green,
      semanticLabel: "Sidebar Menu",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 71.h),
        child: Column(
          children: [
            Column(
              children: List.generate(sideMenuItems.length, (index) {
                return SideMenuItems(sideMenuModel: sideMenuItems[index]);
              }),
            ),
            verticalSpace(48),
            GestureDetector(
              onTap: () => logOut(context),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'assets/icons/logout-icon.svg',
                      width: 20.61.w,
                      height: 20.65.h,
                    ),
                  ),
                  horizontalSpace(32),
                  Text("Log Out", style: AppTextStyle.font24YellowTwoMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuItems extends StatelessWidget {
  final SideMenuModel sideMenuModel;
  const SideMenuItems({super.key, required this.sideMenuModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        GestureDetector(
          onTap: () => sideMenuModel.onTap?.call(context),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.r),
                height: 40.3.h,
                width: 40.3.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: SvgPicture.asset(
                  sideMenuModel.icon,
                  width: 20.61.w,
                  height: 20.65.h,
                ),
              ),
              horizontalSpace(32),
              Expanded(
                child: Text(
                  sideMenuModel.title,
                  style: AppTextStyle.font24YellowTwoMedium,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(17.7),
        Divider(color: Colors.white, thickness: .8.h),
      ],
    );
  }
}
