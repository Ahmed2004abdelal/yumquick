import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/my-orders/data/models/complete_order_model.dart';
import 'package:yumquick/features/my-orders/data/models/get_orders_model.dart';

part 'orders_state.freezed.dart';

enum OrdersStatus { initial, loading, success, failure }

// enum OrdersTab { active, completed, cancelled }

@freezed
abstract class OrdersState with _$OrdersState {
  const OrdersState._();

  const factory OrdersState({
    @Default(OrdersStatus.initial) OrdersStatus status,
    @Default(OrdersStatus.initial) OrdersStatus cancellationStatus,
    @Default(OrdersStatus.initial) OrdersStatus getCompleteOrderStatus,
    @Default(OrdersStatus.initial) OrdersStatus addReviewStatus,
    @Default(OrdersStatus.initial) OrdersStatus createIssueStatus,
    String? createIssueError,
    @Default([]) List<GetOrdersModel> orders,
    CompleteOrderModel? completedOrder,
    @Default(0) int selectedTab,
    int? cancelOrderSelectedId,
    @Default(false) bool isCancelling,
    String? error,
    String? cancellationError,
    String? getCompleteOrderError,
    String? addReviewError,
    String? message,
  }) = _OrdersState;

  List<GetOrdersModel> get visibleOrders => orders.where((o) {
    switch (selectedTab) {
      case 0:
        return o.status >= 0 && o.status <= 3;
      case 1:
        return o.status == 4;
      case 2:
        return o.status == 5;
      default:
        return false;
    }
  }).toList();
}
