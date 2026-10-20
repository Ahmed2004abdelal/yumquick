import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/features/my-orders/data/models/get_orders_model.dart';
import 'package:yumquick/features/my-orders/logic/orders_cubit.dart';
import 'package:yumquick/features/my-orders/logic/orders_state.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(title: "My Orders", showBackButton: false),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.all(35.w),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            BlocSelector<OrdersCubit, OrdersState, int>(
              selector: (state) => state.selectedTab,
              builder: (context, selectedTab) => OrdersTabBar(
                selectedIndex: selectedTab,
                onChanged: (i) => context.read<OrdersCubit>().selectTab(i),
              ),
            ),
            const Expanded(child: MyOrdersBlockBuilder()),
          ],
        ),
      ),
    );
  }
}

class MyOrdersBlockBuilder extends StatelessWidget {
  const MyOrdersBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        switch (state.status) {
          case OrdersStatus.success:
            final orders = state.visibleOrders;
            return RefreshIndicator(
              color: AppColors.orangeBase,
              onRefresh: () =>
                  context.read<OrdersCubit>().loadOrders(silent: true),
              child: orders.isEmpty
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: 120.h),
                        const Center(child: Text('No orders here yet')),
                      ],
                    )
                  : ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: orders.length,
                      itemBuilder: (context, i) => OrderDetailsShow(
                        order: orders[i],
                        tab: state.selectedTab,
                      ),
                    ),
            );
          case OrdersStatus.failure:
            return Center(child: Text(state.error ?? 'something went wrong'));
          default:
            return const Center(
              child: SpinKitDancingSquare(
                color: AppColors.orangeBase,
                size: 50.0,
              ),
            );
        }
      },
    );
  }
}

class OrderDetailsShow extends StatelessWidget {
  final GetOrdersModel order;
  final int tab;
  const OrderDetailsShow({super.key, required this.order, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1, color: AppColors.orangeTwo),
        verticalSpace(19.h),
        SizedBox(
          height: 108.h,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 71.68.w,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/order-icon.png'),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(19.12.r),
                ),
              ),
              // horizontalSpace(14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order #${order.id}',
                          maxLines: 1,
                          style: AppTextStyle.font20BlackMedium.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '\$${order.totalAmount.toStringAsFixed(2)}',
                          style: AppTextStyle.font20OrangeBaseMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('d MMM, hh:mm a').format(order.createdAt),
                          style: AppTextStyle.font14BlackLight,
                        ),
                        Text(
                          '${order.itemCount} ${order.itemCount == 1 ? 'item' : 'items'}',
                          style: AppTextStyle.font14BlackLight,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: tab == 0
                          ? [
                              const Spacer(),
                              CustomButton(
                                width: 110.w,
                                height: 26.h,
                                onPressed: () => context.pushNamed(
                                  Routes.cancelOrderScreen,
                                  arguments: {
                                    'cubit': context.read<OrdersCubit>(),
                                    'orderId': order.id,
                                  },
                                ),
                                text: 'Cancel Order',
                              ),
                            ]
                          : tab == 1
                          ? [
                              Expanded(
                                child: CustomButton(
                                  height: 26.h,
                                  onPressed: () {
                                    context.pushNamed(
                                      Routes.addReviewScreen,
                                      arguments: {
                                        'cubit': context.read<OrdersCubit>(),
                                        'orderId': order.id,
                                      },
                                    );
                                  },
                                  text: 'add review',
                                  textStyle:
                                      AppTextStyle.font15WhiteBaseRegular,
                                ),
                              ),
                              horizontalSpace(8.w),
                              Expanded(
                                child: CustomButton(
                                  height: 26.h,
                                  onPressed: () async {
                                    // final cubit = context.read<OrdersCubit>();
                                    // final checkoutModel = await cubit.orderAgain(order.id);
                                    // if (checkoutModel != null && context.mounted) {
                                    //   context.pushNamed(
                                    //     Routes.checkout,
                                    //     arguments: checkoutModel,
                                    //   );
                                    // }
                                    //! handle re-ordering from ask backend some edits
                                  },
                                  text: 'Order Again',
                                  backgroundColor: AppColors.orangeTwo,
                                  textStyle:
                                      AppTextStyle.font13OrangeBaseRegular,
                                ),
                              ),
                            ]
                          : [
                              const Icon(
                                Icons.cancel_outlined,
                                color: AppColors.orangeBase,
                                size: 20,
                              ),
                              horizontalSpace(5),
                              Text(
                                'Order cancelled',
                                style: AppTextStyle.font14OrangeBaseLight,
                              ),
                            ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(19.h),
      ],
    );
  }
}

class OrdersTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const OrdersTabBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  static const _tabs = ['Active', 'Completed', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(_tabs.length, (i) {
            final selected = i == selectedIndex;
            return Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: i == _tabs.length - 1 ? 0 : 8.w,
                ),
                child: GestureDetector(
                  onTap: () => onChanged(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 28.h,
                    width: 104.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.orangeBase
                          : AppColors.orangeTwo,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      _tabs[i],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: selected ? Colors.white : AppColors.orangeBase,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
