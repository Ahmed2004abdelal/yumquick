import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/helper/spacer.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';
import 'package:yumquick/core/widgets/custom_app_bar.dart';
import 'package:yumquick/core/widgets/custom_textform.dart';
import 'package:yumquick/features/help/data/models/issue_messages_model.dart';
import 'package:yumquick/features/help/logic/help_cubit.dart';
import 'package:yumquick/features/help/logic/help_state.dart';

class IssueChatScreen extends StatefulWidget {
  final String issueTitle;
  const IssueChatScreen({super.key, required this.issueTitle});

  @override
  State<IssueChatScreen> createState() => _IssueChatScreenState();
}

class _IssueChatScreenState extends State<IssueChatScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void _send() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    messageController.clear();
    context.read<HelpCubit>().replyToIssue(text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HelpCubit, HelpState>(
      listenWhen: (p, c) => p.replyStatus != c.replyStatus,
      listener: (context, state) {
        if (state.replyStatus == HelpStatus.failure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.yellowBase,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100.h,
          backgroundColor: AppColors.yellowBase,
          flexibleSpace: CustomAppBar(title: widget.issueTitle),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 80.h,
          color: AppColors.orangeTwo,
          child: Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 260.w,
                  height: 40.h,
                  child: CustomTextForm(
                    fillColor: Colors.white,
                    controller: messageController,
                    hint: "Write Here...",
                    isObsecure: false,
                    validator: (val) => null,
                  ),
                ),
                horizontalSpace(10),
                GestureDetector(
                  onTap: _send,
                  child: Container(
                    padding: EdgeInsets.all(5.w),
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.03.r),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/send-icon.svg',
                      width: 14.42.w,
                      height: 14.42.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          child: const MessagesIssueBuilder(),
        ),
      ),
    );
  }
}

class MessagesIssueBuilder extends StatelessWidget {
  const MessagesIssueBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCubit, HelpState>(
      buildWhen: (p, c) =>
          p.issueMessagesStatus != c.issueMessagesStatus ||
          p.issueMessages != c.issueMessages,
      builder: (context, state) {
        switch (state.issueMessagesStatus) {
          case HelpStatus.success:
            return MessagesShow(messages: state.issueMessages!.messages);
          case HelpStatus.failure:
            return Center(
              child: Text(
                'Something went wrong',
                style: AppTextStyle.font16BOrangeBaseMedium,
              ),
            );
          default:
            return Center(
              child: CircularProgressIndicator(color: AppColors.orangeBase),
            );
        }
      },
    );
  }
}

class MessagesShow extends StatelessWidget {
  final List<MessagesModel> messages;
  const MessagesShow({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    // reverse: true keeps the list anchored to the bottom (newest message)
    // and scrolls when there are many messages.
    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.only(bottom: 60.h),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index];
        final isAdmin = message.isAdmin;
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            mainAxisAlignment: isAdmin
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              BubbleSpecialOne(
                text: message.message,
                color: isAdmin ? AppColors.orangeBase : AppColors.font,
                tail: true,
                isSender: !isAdmin,
                textStyle: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
