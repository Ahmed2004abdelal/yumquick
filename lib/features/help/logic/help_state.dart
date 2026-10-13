import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/help/data/models/issue_messages_model.dart';
import 'package:yumquick/features/help/data/models/support_issues_model.dart';

part 'help_state.freezed.dart';

@freezed
abstract class HelpState with _$HelpState {
  const factory HelpState({
    @Default(HelpStatus.initial) HelpStatus supportIssuesStatus,
    @Default(HelpStatus.initial) HelpStatus issueMessagesStatus,
    @Default(HelpStatus.initial) HelpStatus replyStatus,
    @Default([]) List<SupportIssuesModel> supportIssues,
    IssueMessagesModel? issueMessages,
    @Default('') String errorMessage,
  }) = _HelpState;
}

enum HelpStatus { initial, loading, success, failure }
