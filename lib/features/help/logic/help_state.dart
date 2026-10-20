import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/help/data/models/contact_us_model.dart';
import 'package:yumquick/features/help/data/models/faq_model.dart';
import 'package:yumquick/features/help/data/models/issue_messages_model.dart';
import 'package:yumquick/features/help/data/models/support_issues_model.dart';

part 'help_state.freezed.dart';

@freezed
abstract class HelpState with _$HelpState {
  const factory HelpState({
    @Default(HelpStatus.initial) HelpStatus supportIssuesStatus,
    @Default(HelpStatus.initial) HelpStatus issueMessagesStatus,
    @Default(HelpStatus.initial) HelpStatus faqStatus,
    @Default(HelpStatus.initial) HelpStatus contactUsStatus,
    @Default(0) int selectedTabIndex,
    @Default(HelpStatus.initial) HelpStatus replyStatus,
    @Default([]) List<SupportIssuesModel> supportIssues,
    @Default([]) List<IssueMessagesModel> issueMessagesList,
    @Default([]) List<FaqModel> faqSuccessList,
    @Default([]) List<ContactUsModel> contactUsSuccessList,
    IssueMessagesModel? issueMessages,
    @Default('') String errorMessage,
  }) = _HelpState;
}

enum HelpStatus { initial, loading, success, failure }
