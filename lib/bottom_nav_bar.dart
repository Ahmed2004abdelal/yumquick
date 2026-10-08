import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquick/core/di/dependency_injection.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/utils/bottom_nav_bar_model.dart';
import 'package:yumquick/features/favorites/data/repos/favorites_repo.dart';
import 'package:yumquick/features/favorites/logic/favorites_cubit.dart';
import 'package:yumquick/features/favorites/ui/favorites_screen.dart';
import 'package:yumquick/features/help/ui/helper_screen.dart';
import 'package:yumquick/features/home/data/repos/home_repo.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';
import 'package:yumquick/features/home/ui/home_screen.dart';
import 'package:yumquick/features/my-orders/ui/my_oreders_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  BottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex;
  bool _isNavBarVisible = true;

  late final List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pages = [
      BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(getIt<HomeRepo>()),
        child: HomeScreen(),
      ),
      BlocProvider<FavoritesCubit>(
        create: (context) => FavoritesCubit(getIt<FavoritesRepo>()),
        child: FavoritesScreen(),
      ),
      MyOrdersScreen(),
      HelperScreen(),
    ];
  }

  void _onTap(int index) => setState(() => _currentIndex = index);

  bool _handleScrollNotification(UserScrollNotification notification) {
    if (notification.depth != 0) return false;

    final direction = notification.direction;

    if (direction == ScrollDirection.reverse && _isNavBarVisible) {
      setState(() => _isNavBarVisible = false);
    } else if (direction == ScrollDirection.forward && !_isNavBarVisible) {
      setState(() => _isNavBarVisible = true);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: _handleScrollNotification,
        child: IndexedStack(index: _currentIndex, children: _pages),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        offset: _isNavBarVisible ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: _isNavBarVisible ? 1 : 0,
          child: _CustomPillNavBar(currentIndex: _currentIndex, onTap: _onTap),
        ),
      ),
    );
  }
}

class _CustomPillNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _CustomPillNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.h,
      width: 327.w,
      padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.orangeBase,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomNavItems.map((item) {
          final bool isSelected = currentIndex == item.id;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap(item.id),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 150),
              scale: isSelected ? 1.5 : 1.0,
              child: SvgPicture.asset(
                item.icon,
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.yellowBase : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
