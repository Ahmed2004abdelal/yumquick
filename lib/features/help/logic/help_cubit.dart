import 'package:bloc/bloc.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/features/help/data/models/issue_messages_model.dart';
import 'package:yumquick/features/help/data/repos/help_repo.dart';
import 'package:yumquick/features/help/logic/help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  final HelpRepo _helpRepo;
  HelpCubit(this._helpRepo) : super(HelpState());

  Future<void> getsupportIssues() async {
    emit(state.copyWith(supportIssuesStatus: HelpStatus.loading));
    final response = await _helpRepo.getSupportIssues();
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            supportIssuesStatus: HelpStatus.success,
            supportIssues: data,
          ),
        );
      },
      failure: (message) {
        emit(
          state.copyWith(
            supportIssuesStatus: HelpStatus.failure,
            errorMessage:
                message.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  Future<void> getIssueMessages(int issueId) async {
    emit(state.copyWith(issueMessagesStatus: HelpStatus.loading));
    final response = await _helpRepo.getIssueMessages(issueId);
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            issueMessagesStatus: HelpStatus.success,
            issueMessages: data,
          ),
        );
      },
      failure: (message) {
        emit(
          state.copyWith(
            issueMessagesStatus: HelpStatus.failure,
            errorMessage:
                message.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  Future<void> replyToIssue(String text) async {
    final current = state.issueMessages;
    final trimmed = text.trim();
    if (current == null || trimmed.isEmpty) return;

    final tempId = -DateTime.now().millisecondsSinceEpoch;
    final tempMessage = MessagesModel(
      id: tempId,
      message: trimmed,
      createdAt: DateTime.now(),
      senderName: 'Me',
      isAdmin: false,
    );

    emit(
      state.copyWith(
        replyStatus: HelpStatus.loading,
        issueMessages: current.copyWith(
          messages: [...current.messages, tempMessage],
        ),
      ),
    );

    final response = await _helpRepo.replyToIssue(current.id, trimmed);

    response.when(
      success: (_) {
        emit(state.copyWith(replyStatus: HelpStatus.success));
      },
      failure: (error) {
        final latest = state.issueMessages!;
        final rolledBack = latest.messages
            .where((m) => m.id != tempId)
            .toList();
        emit(
          state.copyWith(
            replyStatus: HelpStatus.failure,
            errorMessage: error.apiErrorModel.message ?? 'Something went wrong',
            issueMessages: latest.copyWith(messages: rolledBack),
          ),
        );
      },
    );
  }

  void changeSelectedTabIndex(int index) {
    emit(state.copyWith(selectedTabIndex: index));
  }

  Future<void> getFaq() async {
    emit(state.copyWith(faqStatus: HelpStatus.loading));
    final response = await _helpRepo.getFAQ();
    response.when(
      success: (data) {
        emit(
          state.copyWith(faqStatus: HelpStatus.success, faqSuccessList: data),
        );
      },
      failure: (message) {
        emit(
          state.copyWith(
            faqStatus: HelpStatus.failure,
            errorMessage:
                message.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  Future<void> getContactUs() async {
    emit(state.copyWith(contactUsStatus: HelpStatus.loading));
    final response = await _helpRepo.getContactInfo();
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            contactUsStatus: HelpStatus.success,
            contactUsSuccessList: data,
          ),
        );
      },
      failure: (message) {
        emit(
          state.copyWith(
            contactUsStatus: HelpStatus.failure,
            errorMessage:
                message.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }
}
