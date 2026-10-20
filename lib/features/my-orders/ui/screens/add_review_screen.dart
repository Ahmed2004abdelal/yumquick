import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/helpers_functions.dart' as Helpers;
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/custom_textform.dart';
import 'package:yumquick/features/my-orders/data/models/complete_order_model.dart';
import 'package:yumquick/features/my-orders/data/models/review_item_model.dart';
import 'package:yumquick/features/my-orders/logic/orders_cubit.dart';
import 'package:yumquick/features/my-orders/logic/orders_state.dart';
import 'package:yumquick/features/my-orders/ui/widgets/create_order_issue_dialog.dart';

class AddReviewScreen extends StatefulWidget {
  final int orderId;
  const AddReviewScreen({super.key, required this.orderId});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<int, double> _ratings = {};
  final Map<int, TextEditingController> _reviewControllers = {};

  @override
  void initState() {
    context.read<OrdersCubit>().getCompleteOrder(widget.orderId);
    super.initState();
  }

  @override
  void dispose() {
    for (final controller in _reviewControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _openCreateIssueDialog() {
    final cubit = context.read<OrdersCubit>();
    cubit.resetCreateIssue();
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: CreateOrderIssueDialog(orderId: widget.orderId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: AppColors.yellowBase,
        automaticallyImplyLeading: false,
        flexibleSpace: const CustomAppBar(
          title: "Leave a Review",
          showBackButton: true,
        ),
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        buildWhen: (prev, curr) =>
            prev.getCompleteOrderStatus != curr.getCompleteOrderStatus ||
            prev.completedOrder != curr.completedOrder,
        builder: (context, state) {
          if (state.getCompleteOrderStatus == OrdersStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.orangeBase),
            );
          }

          if (state.getCompleteOrderStatus == OrdersStatus.failure) {
            return Center(
              child: Text(
                state.getCompleteOrderError ?? 'Failed to load order details',
                style: AppTextStyle.font16BlackRegular,
              ),
            );
          }

          final order = state.completedOrder;
          if (order == null) {
            return Center(
              child: Text(
                'Order not found',
                style: AppTextStyle.font16BlackRegular,
              ),
            );
          }

          for (final item in order.items) {
            if (!_reviewControllers.containsKey(item.productId)) {
              _reviewControllers[item.productId] = TextEditingController();
              _ratings[item.productId] = 0.0;
            }
          }

          return _buildReviewForm(context, order);
        },
      ),
    );
  }

  Widget _buildReviewForm(BuildContext context, CompleteOrderModel order) {
    return Container(
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
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('How was your order?', style: AppTextStyle.font24BlackBold),
              verticalSpace(8.h),
              Text(
                'Order #${order.id}',
                style: AppTextStyle.font14BlackLight.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              verticalSpace(24.h),
              Text('Rate each item', style: AppTextStyle.font18BlackSemiBold),
              verticalSpace(12.h),
              ...order.items.map((item) => _buildItemReviewCard(item)),
              verticalSpace(20.h),
              Center(
                child: TextButton.icon(
                  onPressed: _openCreateIssueDialog,
                  icon: const Icon(
                    Icons.support_agent,
                    color: AppColors.orangeBase,
                  ),
                  label: Text(
                    'Report a problem with this order',
                    style: AppTextStyle.font14BlackMedium,
                  ),
                ),
              ),
              verticalSpace(12.h),
              _buildSubmitButton(context, order),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemReviewCard(ItemsModel item) {
    final productId = item.productId;
    final rating = _ratings[productId] ?? 0.0;
    final controller = _reviewControllers[productId]!;

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.yellowTwo,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  item.productImage,
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 60.w,
                    height: 60.h,
                    color: AppColors.orangeTwo,
                    child: Icon(Icons.fastfood, color: AppColors.orangeBase),
                  ),
                ),
              ),
              horizontalSpace(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      style: AppTextStyle.font16BlackSemiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4.h),
                    Text(
                      'Qty: ${item.quantity}',
                      style: AppTextStyle.font14BlackLight,
                    ),
                    if (item.variants.isNotEmpty) ...[
                      verticalSpace(4.h),
                      Wrap(
                        spacing: 6.w,
                        children: item.variants.map((v) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.orangeTwo,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              v.name,
                              style: AppTextStyle.font12OrangeBaseMedium,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(16.h),
          // Rating
          Text('Your Rating', style: AppTextStyle.font14BlackMedium),
          verticalSpace(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starValue = index + 1.0;
              return GestureDetector(
                onTap: () =>
                    setState(() => _ratings[productId] = starValue.toDouble()),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Icon(
                    rating >= starValue
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: AppColors.orangeBase,
                    size: 32.sp,
                  ),
                ),
              );
            }),
          ),
          verticalSpace(8.h),
          Center(
            child: Text(
              rating > 0 ? Helpers.getRatingLabel(rating) : 'Tap to rate',
              style: AppTextStyle.font12BlackLight.copyWith(
                color: rating > 0 ? AppColors.orangeBase : Colors.grey[600],
              ),
            ),
          ),
          verticalSpace(16.h),
          // Review Text Field
          Text('Your Review (Optional)', style: AppTextStyle.font14BlackMedium),
          verticalSpace(8.h),
          CustomTextForm(
            controller: controller,
            hint: 'Share your experience with ${item.productName}...',
            isObsecure: false,
            maxLines: 3,
            validator: (value) {
              if (value != null && value.trim().length > 500) {
                return 'Review must be less than 500 characters';
              }
              return null;
            },
            contentPadding: EdgeInsets.all(12.w),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, CompleteOrderModel order) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listenWhen: (prev, curr) => prev.addReviewStatus != curr.addReviewStatus,
      listener: (context, state) {
        if (state.addReviewStatus == OrdersStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'All reviews submitted successfully!',
                style: AppTextStyle.font15WhiteBaseRegular,
              ),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, true);
        } else if (state.addReviewStatus == OrdersStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.addReviewError ?? 'Failed to submit reviews',
                style: AppTextStyle.font15WhiteBaseRegular,
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      buildWhen: (prev, curr) => prev.addReviewStatus != curr.addReviewStatus,
      builder: (context, state) {
        final isLoading = state.addReviewStatus == OrdersStatus.loading;
        final allRated = order.items.every(
          (item) => (_ratings[item.productId] ?? 0.0) > 0,
        );
        return Center(
          child: CustomButton(
            height: 48.h,
            onPressed: isLoading || !allRated
                ? null
                : () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final reviews = order.items.map((item) {
                        return ReviewItem(
                          productId: item.productId,
                          rating: (_ratings[item.productId] ?? 0.0).toInt(),
                          comment:
                              _reviewControllers[item.productId]?.text.trim() ??
                              '',
                        );
                      }).toList();

                      context.read<OrdersCubit>().addReviews(
                        orderId: widget.orderId,
                        reviews: reviews,
                      );
                    }
                  },
            text: isLoading ? 'Submitting...' : 'Submit All Reviews',
            backgroundColor: allRated
                ? AppColors.orangeBase
                : AppColors.orangeTwo,
          ),
        );
      },
    );
  }
}
