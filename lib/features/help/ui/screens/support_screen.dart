import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/helper/extensions.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/features/help/logic/help_cubit.dart';
import 'package:yumquick/features/help/logic/help_state.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: AppColors.yellowBase,
        flexibleSpace: CustomAppBar(title: 'Support'),
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
            Text('Your support issues', style: AppTextStyle.font20BlackMedium),
            verticalSpace(20),
            SupprtIssuesShow(),
          ],
        ),
      ),
    );
  }
}

class SupprtIssuesShow extends StatelessWidget {
  const SupprtIssuesShow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HelpCubit, HelpState>(
      buildWhen: (p, c) => p.supportIssuesStatus != c.supportIssuesStatus,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.supportIssuesStatus) {
          case HelpStatus.success:
            return Column(
              spacing: 10.h,
              children: state.supportIssues.isEmpty
                  ? [
                      Center(
                        child: Text(
                          'No support issues found',
                          style: AppTextStyle.font20OrangeBaseMedium,
                        ),
                      ),
                    ]
                  : List.generate(state.supportIssues.length, (index) {
                      final issue = state.supportIssues[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            Routes.issueChatScreen,
                            arguments: {
                              'cubit': context.read<HelpCubit>()
                                ..getIssueMessages(issue.id),
                              'issueTitle': issue.subject,
                            },
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Icon(
                                Icons.support_agent,
                                size: 50.sp,
                                color: AppColors.orangeBase,
                              ),
                              horizontalSpace(10),
                              Text(
                                issue.subject,
                                style: AppTextStyle.font14BlackMedium,
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.sp,
                                color: AppColors.orangeBase,
                              ),
                              horizontalSpace(10),
                            ],
                          ),
                        ),
                      );
                    }),
            );
          case HelpStatus.failure:
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyle.font20OrangeBaseMedium,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
