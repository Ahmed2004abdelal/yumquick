import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/features/home/ui/widgets/home/home_app_bar.dart';
import 'package:yumquick/features/home/ui/widgets/home/home_content.dart';
import 'package:yumquick/features/home/ui/widgets/home/sidebar_menu.dart';

import '../../../core/theme/app_colors.dart';
import '../logic/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SidebarMenu(),
      backgroundColor: AppColors.yellowBase,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) => _onScroll(context, scrollInfo),
        child: CustomScrollView(
          slivers: [
            HomeAppBar(searchController: searchController),
            SliverToBoxAdapter(child: HomeContent()),
          ],
        ),
      ),
    );
  }

  bool _onScroll(BuildContext context, ScrollNotification scrollInfo) {
    final cubit = context.read<HomeCubit>();
    final nearBottom =
        scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 200;

    if (nearBottom && cubit.state.categoryId != 0) {
      cubit.getProductByCategory(cubit.state.categoryId, isLoadMore: true);
    }
    return false;
  }
}
