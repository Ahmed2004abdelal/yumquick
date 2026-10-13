import 'package:bloc/bloc.dart';
import 'package:yumquick/core/networking/api_result.dart';
import 'package:yumquick/core/utils/models/default_request.dart';
import 'package:yumquick/features/my-orders/data/models/create_issue_model.dart';
import 'package:yumquick/features/my-orders/data/models/review_item_model.dart';
import 'package:yumquick/features/my-orders/data/repos/order_repo.dart';
import 'package:yumquick/features/my-orders/logic/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrderRepo _orderRepo;
  OrdersCubit(this._orderRepo) : super(OrdersState()) {
    loadOrders();
  }

  void selectTab(int tab) => emit(state.copyWith(selectedTab: tab));
  void selectCancelOrderReason(int id) =>
      emit(state.copyWith(cancelOrderSelectedId: id));

  Future<void> loadOrders({bool silent = false}) async {
    if (!silent) {
      emit(state.copyWith(status: OrdersStatus.loading, error: null));
    }
    final result = await _orderRepo.getOrders();
    result.when(
      success: (data) =>
          emit(state.copyWith(status: OrdersStatus.success, orders: data)),
      failure: (message) {
        if (silent && state.orders.isNotEmpty) return;
        emit(
          state.copyWith(
            status: OrdersStatus.failure,
            error: message.apiErrorModel.message ?? 'something went wrong',
          ),
        );
      },
    );
  }

  Future<void> cancelOrder(int orderId) async {
    final reasonId = state.cancelOrderSelectedId;
    if (reasonId == null) return;

    emit(state.copyWith(cancellationStatus: OrdersStatus.loading));
    final response = await _orderRepo.cancelOrder(
      orderId,
      DefaultRequest(cancelReasonId: state.cancelOrderSelectedId?.toString()),
    );
    await response.when(
      success: (_) async {
        await loadOrders(silent: true);
        emit(
          state.copyWith(
            cancellationStatus: OrdersStatus.success,
            cancelOrderSelectedId: null,
          ),
        );
      },
      failure: (message) async => emit(
        state.copyWith(
          cancellationStatus: OrdersStatus.failure,
          cancellationError:
              message.apiErrorModel.message ?? 'something went wrong',
        ),
      ),
    );
  }

  Future<void> getCompleteOrder(int orderId) async {
    emit(state.copyWith(getCompleteOrderStatus: OrdersStatus.loading));
    final response = await _orderRepo.getCompleteOrder(orderId);
    response.when(
      success: (data) {
        emit(
          state.copyWith(
            getCompleteOrderStatus: OrdersStatus.success,
            completedOrder: data,
          ),
        );
      },
      failure: (message) => emit(
        state.copyWith(
          getCompleteOrderStatus: OrdersStatus.failure,
          getCompleteOrderError:
              message.apiErrorModel.message ?? 'something went wrong',
        ),
      ),
    );
  }

  Future<void> addReviews({
    required int orderId,
    required List<ReviewItem> reviews,
  }) async {
    emit(
      state.copyWith(
        addReviewStatus: OrdersStatus.loading,
        addReviewError: null,
      ),
    );
    final response = await _orderRepo.addReviews(
      orderId: orderId,
      reviews: reviews,
    );
    await response.when(
      success: (_) async {
        emit(
          state.copyWith(
            addReviewStatus: OrdersStatus.success,
            addReviewError: null,
          ),
        );
      },
      failure: (message) async => emit(
        state.copyWith(
          addReviewStatus: OrdersStatus.failure,
          addReviewError:
              message.apiErrorModel.message ?? 'Failed to submit review',
        ),
      ),
    );
  }

  void resetCreateIssue() => emit(
    state.copyWith(
      createIssueStatus: OrdersStatus.initial,
      createIssueError: null,
    ),
  );

  Future<void> createIssue(CreateIssueModel body) async {
    emit(
      state.copyWith(
        createIssueStatus: OrdersStatus.loading,
        createIssueError: null,
      ),
    );
    final response = await _orderRepo.createIssue(body);
    response.when(
      success: (_) {
        emit(state.copyWith(createIssueStatus: OrdersStatus.success));
      },
      failure: (error) {
        emit(
          state.copyWith(
            createIssueStatus: OrdersStatus.failure,
            createIssueError:
                error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }
}
