// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersState {

 OrdersStatus get status; OrdersStatus get cancellationStatus; OrdersStatus get getCompleteOrderStatus; OrdersStatus get addReviewStatus; OrdersStatus get createIssueStatus; String? get createIssueError; List<GetOrdersModel> get orders; CompleteOrderModel? get completedOrder; int get selectedTab; int? get cancelOrderSelectedId; bool get isCancelling; String? get error; String? get cancellationError; String? get getCompleteOrderError; String? get addReviewError; String? get message;
/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersStateCopyWith<OrdersState> get copyWith => _$OrdersStateCopyWithImpl<OrdersState>(this as OrdersState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrdersState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.cancellationStatus, _this.cancellationStatus) || other.cancellationStatus == _this.cancellationStatus)&&(identical(other.getCompleteOrderStatus, _this.getCompleteOrderStatus) || other.getCompleteOrderStatus == _this.getCompleteOrderStatus)&&(identical(other.addReviewStatus, _this.addReviewStatus) || other.addReviewStatus == _this.addReviewStatus)&&(identical(other.createIssueStatus, _this.createIssueStatus) || other.createIssueStatus == _this.createIssueStatus)&&(identical(other.createIssueError, _this.createIssueError) || other.createIssueError == _this.createIssueError)&&const DeepCollectionEquality().equals(other.orders, _this.orders)&&(identical(other.completedOrder, _this.completedOrder) || other.completedOrder == _this.completedOrder)&&(identical(other.selectedTab, _this.selectedTab) || other.selectedTab == _this.selectedTab)&&(identical(other.cancelOrderSelectedId, _this.cancelOrderSelectedId) || other.cancelOrderSelectedId == _this.cancelOrderSelectedId)&&(identical(other.isCancelling, _this.isCancelling) || other.isCancelling == _this.isCancelling)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.cancellationError, _this.cancellationError) || other.cancellationError == _this.cancellationError)&&(identical(other.getCompleteOrderError, _this.getCompleteOrderError) || other.getCompleteOrderError == _this.getCompleteOrderError)&&(identical(other.addReviewError, _this.addReviewError) || other.addReviewError == _this.addReviewError)&&(identical(other.message, _this.message) || other.message == _this.message));
}


@override
int get hashCode {
  final _this = this as OrdersState;
  return Object.hash(runtimeType,_this.status,_this.cancellationStatus,_this.getCompleteOrderStatus,_this.addReviewStatus,_this.createIssueStatus,_this.createIssueError,const DeepCollectionEquality().hash(_this.orders),_this.completedOrder,_this.selectedTab,_this.cancelOrderSelectedId,_this.isCancelling,_this.error,_this.cancellationError,_this.getCompleteOrderError,_this.addReviewError,_this.message);
}

@override
String toString() {
  final _this = this as OrdersState;
  return 'OrdersState(status: ${_this.status}, cancellationStatus: ${_this.cancellationStatus}, getCompleteOrderStatus: ${_this.getCompleteOrderStatus}, addReviewStatus: ${_this.addReviewStatus}, createIssueStatus: ${_this.createIssueStatus}, createIssueError: ${_this.createIssueError}, orders: ${_this.orders}, completedOrder: ${_this.completedOrder}, selectedTab: ${_this.selectedTab}, cancelOrderSelectedId: ${_this.cancelOrderSelectedId}, isCancelling: ${_this.isCancelling}, error: ${_this.error}, cancellationError: ${_this.cancellationError}, getCompleteOrderError: ${_this.getCompleteOrderError}, addReviewError: ${_this.addReviewError}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $OrdersStateCopyWith<$Res>  {
  factory $OrdersStateCopyWith(OrdersState value, $Res Function(OrdersState) _then) = _$OrdersStateCopyWithImpl;
@useResult
$Res call({
 OrdersStatus status, OrdersStatus cancellationStatus, OrdersStatus getCompleteOrderStatus, OrdersStatus addReviewStatus, OrdersStatus createIssueStatus, String? createIssueError, List<GetOrdersModel> orders, CompleteOrderModel? completedOrder, int selectedTab, int? cancelOrderSelectedId, bool isCancelling, String? error, String? cancellationError, String? getCompleteOrderError, String? addReviewError, String? message
});




}
/// @nodoc
class _$OrdersStateCopyWithImpl<$Res>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._self, this._then);

  final OrdersState _self;
  final $Res Function(OrdersState) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? cancellationStatus = null,Object? getCompleteOrderStatus = null,Object? addReviewStatus = null,Object? createIssueStatus = null,Object? createIssueError = freezed,Object? orders = null,Object? completedOrder = freezed,Object? selectedTab = null,Object? cancelOrderSelectedId = freezed,Object? isCancelling = null,Object? error = freezed,Object? cancellationError = freezed,Object? getCompleteOrderError = freezed,Object? addReviewError = freezed,Object? message = freezed,}) {
  return _then(OrdersState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrdersStatus,cancellationStatus: null == cancellationStatus ? _self.cancellationStatus : cancellationStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,getCompleteOrderStatus: null == getCompleteOrderStatus ? _self.getCompleteOrderStatus : getCompleteOrderStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,addReviewStatus: null == addReviewStatus ? _self.addReviewStatus : addReviewStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,createIssueStatus: null == createIssueStatus ? _self.createIssueStatus : createIssueStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,createIssueError: freezed == createIssueError ? _self.createIssueError : createIssueError // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<GetOrdersModel>,completedOrder: freezed == completedOrder ? _self.completedOrder : completedOrder // ignore: cast_nullable_to_non_nullable
as CompleteOrderModel?,selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as int,cancelOrderSelectedId: freezed == cancelOrderSelectedId ? _self.cancelOrderSelectedId : cancelOrderSelectedId // ignore: cast_nullable_to_non_nullable
as int?,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,cancellationError: freezed == cancellationError ? _self.cancellationError : cancellationError // ignore: cast_nullable_to_non_nullable
as String?,getCompleteOrderError: freezed == getCompleteOrderError ? _self.getCompleteOrderError : getCompleteOrderError // ignore: cast_nullable_to_non_nullable
as String?,addReviewError: freezed == addReviewError ? _self.addReviewError : addReviewError // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersState].
extension OrdersStatePatterns on OrdersState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersState value)  $default,){
final _that = this;
switch (_that) {
case _OrdersState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersState value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrdersStatus status,  OrdersStatus cancellationStatus,  OrdersStatus getCompleteOrderStatus,  OrdersStatus addReviewStatus,  OrdersStatus createIssueStatus,  String? createIssueError,  List<GetOrdersModel> orders,  CompleteOrderModel? completedOrder,  int selectedTab,  int? cancelOrderSelectedId,  bool isCancelling,  String? error,  String? cancellationError,  String? getCompleteOrderError,  String? addReviewError,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that.status,_that.cancellationStatus,_that.getCompleteOrderStatus,_that.addReviewStatus,_that.createIssueStatus,_that.createIssueError,_that.orders,_that.completedOrder,_that.selectedTab,_that.cancelOrderSelectedId,_that.isCancelling,_that.error,_that.cancellationError,_that.getCompleteOrderError,_that.addReviewError,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrdersStatus status,  OrdersStatus cancellationStatus,  OrdersStatus getCompleteOrderStatus,  OrdersStatus addReviewStatus,  OrdersStatus createIssueStatus,  String? createIssueError,  List<GetOrdersModel> orders,  CompleteOrderModel? completedOrder,  int selectedTab,  int? cancelOrderSelectedId,  bool isCancelling,  String? error,  String? cancellationError,  String? getCompleteOrderError,  String? addReviewError,  String? message)  $default,) {final _that = this;
switch (_that) {
case _OrdersState():
return $default(_that.status,_that.cancellationStatus,_that.getCompleteOrderStatus,_that.addReviewStatus,_that.createIssueStatus,_that.createIssueError,_that.orders,_that.completedOrder,_that.selectedTab,_that.cancelOrderSelectedId,_that.isCancelling,_that.error,_that.cancellationError,_that.getCompleteOrderError,_that.addReviewError,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrdersStatus status,  OrdersStatus cancellationStatus,  OrdersStatus getCompleteOrderStatus,  OrdersStatus addReviewStatus,  OrdersStatus createIssueStatus,  String? createIssueError,  List<GetOrdersModel> orders,  CompleteOrderModel? completedOrder,  int selectedTab,  int? cancelOrderSelectedId,  bool isCancelling,  String? error,  String? cancellationError,  String? getCompleteOrderError,  String? addReviewError,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _OrdersState() when $default != null:
return $default(_that.status,_that.cancellationStatus,_that.getCompleteOrderStatus,_that.addReviewStatus,_that.createIssueStatus,_that.createIssueError,_that.orders,_that.completedOrder,_that.selectedTab,_that.cancelOrderSelectedId,_that.isCancelling,_that.error,_that.cancellationError,_that.getCompleteOrderError,_that.addReviewError,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _OrdersState extends OrdersState {
  const _OrdersState({this.status = OrdersStatus.initial, this.cancellationStatus = OrdersStatus.initial, this.getCompleteOrderStatus = OrdersStatus.initial, this.addReviewStatus = OrdersStatus.initial, this.createIssueStatus = OrdersStatus.initial, this.createIssueError,  List<GetOrdersModel> orders = const [], this.completedOrder, this.selectedTab = 0, this.cancelOrderSelectedId, this.isCancelling = false, this.error, this.cancellationError, this.getCompleteOrderError, this.addReviewError, this.message}): _orders = orders,super._();
  

@override@JsonKey() final  OrdersStatus status;
@override@JsonKey() final  OrdersStatus cancellationStatus;
@override@JsonKey() final  OrdersStatus getCompleteOrderStatus;
@override@JsonKey() final  OrdersStatus addReviewStatus;
@override@JsonKey() final  OrdersStatus createIssueStatus;
@override final  String? createIssueError;
 final  List<GetOrdersModel> _orders;
@override@JsonKey() List<GetOrdersModel> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

@override final  CompleteOrderModel? completedOrder;
@override@JsonKey() final  int selectedTab;
@override final  int? cancelOrderSelectedId;
@override@JsonKey() final  bool isCancelling;
@override final  String? error;
@override final  String? cancellationError;
@override final  String? getCompleteOrderError;
@override final  String? addReviewError;
@override final  String? message;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersStateCopyWith<_OrdersState> get copyWith => __$OrdersStateCopyWithImpl<_OrdersState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersState&&(identical(other.status, status) || other.status == status)&&(identical(other.cancellationStatus, cancellationStatus) || other.cancellationStatus == cancellationStatus)&&(identical(other.getCompleteOrderStatus, getCompleteOrderStatus) || other.getCompleteOrderStatus == getCompleteOrderStatus)&&(identical(other.addReviewStatus, addReviewStatus) || other.addReviewStatus == addReviewStatus)&&(identical(other.createIssueStatus, createIssueStatus) || other.createIssueStatus == createIssueStatus)&&(identical(other.createIssueError, createIssueError) || other.createIssueError == createIssueError)&&const DeepCollectionEquality().equals(other.orders, _orders)&&(identical(other.completedOrder, completedOrder) || other.completedOrder == completedOrder)&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.cancelOrderSelectedId, cancelOrderSelectedId) || other.cancelOrderSelectedId == cancelOrderSelectedId)&&(identical(other.isCancelling, isCancelling) || other.isCancelling == isCancelling)&&(identical(other.error, error) || other.error == error)&&(identical(other.cancellationError, cancellationError) || other.cancellationError == cancellationError)&&(identical(other.getCompleteOrderError, getCompleteOrderError) || other.getCompleteOrderError == getCompleteOrderError)&&(identical(other.addReviewError, addReviewError) || other.addReviewError == addReviewError)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,cancellationStatus,getCompleteOrderStatus,addReviewStatus,createIssueStatus,createIssueError,const DeepCollectionEquality().hash(_orders),completedOrder,selectedTab,cancelOrderSelectedId,isCancelling,error,cancellationError,getCompleteOrderError,addReviewError,message);
}

@override
String toString() {
    return 'OrdersState(status: $status, cancellationStatus: $cancellationStatus, getCompleteOrderStatus: $getCompleteOrderStatus, addReviewStatus: $addReviewStatus, createIssueStatus: $createIssueStatus, createIssueError: $createIssueError, orders: $orders, completedOrder: $completedOrder, selectedTab: $selectedTab, cancelOrderSelectedId: $cancelOrderSelectedId, isCancelling: $isCancelling, error: $error, cancellationError: $cancellationError, getCompleteOrderError: $getCompleteOrderError, addReviewError: $addReviewError, message: $message)';
}


}

/// @nodoc
abstract mixin class _$OrdersStateCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$OrdersStateCopyWith(_OrdersState value, $Res Function(_OrdersState) _then) = __$OrdersStateCopyWithImpl;
@override @useResult
$Res call({
 OrdersStatus status, OrdersStatus cancellationStatus, OrdersStatus getCompleteOrderStatus, OrdersStatus addReviewStatus, OrdersStatus createIssueStatus, String? createIssueError, List<GetOrdersModel> orders, CompleteOrderModel? completedOrder, int selectedTab, int? cancelOrderSelectedId, bool isCancelling, String? error, String? cancellationError, String? getCompleteOrderError, String? addReviewError, String? message
});




}
/// @nodoc
class __$OrdersStateCopyWithImpl<$Res>
    implements _$OrdersStateCopyWith<$Res> {
  __$OrdersStateCopyWithImpl(this._self, this._then);

  final _OrdersState _self;
  final $Res Function(_OrdersState) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? cancellationStatus = null,Object? getCompleteOrderStatus = null,Object? addReviewStatus = null,Object? createIssueStatus = null,Object? createIssueError = freezed,Object? orders = null,Object? completedOrder = freezed,Object? selectedTab = null,Object? cancelOrderSelectedId = freezed,Object? isCancelling = null,Object? error = freezed,Object? cancellationError = freezed,Object? getCompleteOrderError = freezed,Object? addReviewError = freezed,Object? message = freezed,}) {
  return _then(_OrdersState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrdersStatus,cancellationStatus: null == cancellationStatus ? _self.cancellationStatus : cancellationStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,getCompleteOrderStatus: null == getCompleteOrderStatus ? _self.getCompleteOrderStatus : getCompleteOrderStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,addReviewStatus: null == addReviewStatus ? _self.addReviewStatus : addReviewStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,createIssueStatus: null == createIssueStatus ? _self.createIssueStatus : createIssueStatus // ignore: cast_nullable_to_non_nullable
as OrdersStatus,createIssueError: freezed == createIssueError ? _self.createIssueError : createIssueError // ignore: cast_nullable_to_non_nullable
as String?,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<GetOrdersModel>,completedOrder: freezed == completedOrder ? _self.completedOrder : completedOrder // ignore: cast_nullable_to_non_nullable
as CompleteOrderModel?,selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as int,cancelOrderSelectedId: freezed == cancelOrderSelectedId ? _self.cancelOrderSelectedId : cancelOrderSelectedId // ignore: cast_nullable_to_non_nullable
as int?,isCancelling: null == isCancelling ? _self.isCancelling : isCancelling // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,cancellationError: freezed == cancellationError ? _self.cancellationError : cancellationError // ignore: cast_nullable_to_non_nullable
as String?,getCompleteOrderError: freezed == getCompleteOrderError ? _self.getCompleteOrderError : getCompleteOrderError // ignore: cast_nullable_to_non_nullable
as String?,addReviewError: freezed == addReviewError ? _self.addReviewError : addReviewError // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
