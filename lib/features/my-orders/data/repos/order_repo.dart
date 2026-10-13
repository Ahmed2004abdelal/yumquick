import 'package:yumquick/core/networking/api_error_handler.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/core/utils/models/default_response.dart';
import 'package:yumquick/core/utils/models/default_request.dart';
import 'package:yumquick/features/my-orders/data/models/complete_order_model.dart';
import 'package:yumquick/features/my-orders/data/models/create_issue_model.dart';
import 'package:yumquick/features/my-orders/data/models/create_issue_response_model.dart';
import 'package:yumquick/features/my-orders/data/models/get_orders_model.dart';
import 'package:yumquick/features/my-orders/data/models/review_item_model.dart';
import 'package:yumquick/features/my-orders/data/models/review_request_model.dart';

class OrderRepo {
  final ApiService _apiService;

  OrderRepo(this._apiService);

  Future<ApiResult<List<GetOrdersModel>>> getOrders() async {
    try {
      final response = await _apiService.getMyOrders();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultResponse>> cancelOrder(
    int orderId,
    DefaultRequest reasonId,
  ) async {
    try {
      final response = await _apiService.cancelOrder(orderId, reasonId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CompleteOrderModel>> getCompleteOrder(int orderId) async {
    try {
      final response = await _apiService.getCompleteOrder(orderId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DefaultResponse>> addReview(
    int orderId,
    ReviewItem review,
  ) async {
    try {
      final request = ReviewRequestModel(
        orderId: orderId,
        productId: review.productId,
        rating: review.rating,
        comment: review.comment,
      );
      final response = await _apiService.addReview(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<DefaultResponse>>> addReviews({
    required int orderId,
    required List<ReviewItem> reviews,
  }) async {
    final results = <DefaultResponse>[];
    for (final review in reviews) {
      final result = await addReview(orderId, review);
      final failed = result.when(
        success: (data) {
          results.add(data);
          return null;
        },
        failure: (error) => error,
      );
      if (failed != null) return ApiResult.failure(failed);
    }
    return ApiResult.success(results);
  }

  Future<ApiResult<CreateIssueResponseModel>> createIssue(
    CreateIssueModel body,
  ) async {
    try {
      final response = await _apiService.createIssue(body);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
