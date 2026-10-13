import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/custom_textform.dart';
import 'package:yumquick/features/my-orders/data/models/create_issue_model.dart';
import 'package:yumquick/features/my-orders/logic/orders_cubit.dart';
import 'package:yumquick/features/my-orders/logic/orders_state.dart';

class CreateOrderIssueDialog extends StatefulWidget {
  final int orderId;
  const CreateOrderIssueDialog({super.key, required this.orderId});

  @override
  State<CreateOrderIssueDialog> createState() => _CreateOrderIssueDialogState();
}

class _CreateOrderIssueDialogState extends State<CreateOrderIssueDialog> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<OrdersCubit>().createIssue(
      CreateIssueModel(
        subject: _subjectController.text.trim(),
        initialMessage: _messageController.text.trim(),
        orderId: widget.orderId,
      ),
    );
  }

  String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) return '$label is required';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listenWhen: (p, c) => p.createIssueStatus != c.createIssueStatus,
      listener: (context, state) {
        if (state.createIssueStatus == OrdersStatus.success) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Issue created successfully',
                style: AppTextStyle.font15WhiteBaseRegular,
              ),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      buildWhen: (p, c) =>
          p.createIssueStatus != c.createIssueStatus ||
          p.createIssueError != c.createIssueError,
      builder: (context, state) {
        final isLoading = state.createIssueStatus == OrdersStatus.loading;
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Report a problem',
                    style: AppTextStyle.font20BlackMedium,
                  ),
                  verticalSpace(4),
                  Text(
                    'Order #${widget.orderId}',
                    style: AppTextStyle.font14BlackLight.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  verticalSpace(20),
                  Text('Subject', style: AppTextStyle.font14BlackMedium),
                  verticalSpace(8),
                  CustomTextForm(
                    controller: _subjectController,
                    hint: 'e.g. Order is too late',
                    isObsecure: false,
                    validator: (v) => _required(v, 'Subject'),
                  ),
                  verticalSpace(16),
                  Text('Message', style: AppTextStyle.font14BlackMedium),
                  verticalSpace(8),
                  CustomTextForm(
                    controller: _messageController,
                    hint: 'Describe your problem...',
                    isObsecure: false,
                    maxLines: 4,
                    validator: (v) => _required(v, 'Message'),
                  ),
                  if (state.createIssueStatus == OrdersStatus.failure &&
                      state.createIssueError != null) ...[
                    verticalSpace(12),
                    Text(
                      state.createIssueError!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                  verticalSpace(24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: isLoading
                              ? null
                              : () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: AppColors.orangeBase,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: CustomButton(
                          height: 48.h,
                          onPressed: isLoading ? null : _submit,
                          text: isLoading ? 'Sending...' : 'Create',
                          backgroundColor: AppColors.orangeBase,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
