import 'package:yumquick/core/networking/api_error_handler.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/core/utils/models/default_response.dart';
import 'package:yumquick/features/help/data/models/contact_us_model.dart';
import 'package:yumquick/features/help/data/models/faq_model.dart';
import 'package:yumquick/features/help/data/models/issue_messages_model.dart';
import 'package:yumquick/features/help/data/models/support_issues_model.dart';

class HelpRepo {
  final ApiService _apiService;

  HelpRepo(this._apiService);

  Future<ApiResult<List<SupportIssuesModel>>> getSupportIssues() async {
    try {
      final response = await _apiService.getSupportIssues();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<IssueMessagesModel>> getIssueMessages(int issueId) async {
    try {
      final response = await _apiService.getIssueMessages(issueId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultResponse>> replyToIssue(
    int issueId,
    String message,
  ) async {
    try {
      final response = await _apiService.replyToIssue(
        issueId,
        DefaultResponse(message: message),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<FaqModel>>> getFAQ() async {
    try {
      final response = await _apiService.getFaqs();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ContactUsModel>>> getContactInfo() async {
    try {
      final response = await _apiService.getContactInfo();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
