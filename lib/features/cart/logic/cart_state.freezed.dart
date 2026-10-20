// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {

 CartStatus get status; String get error; List<CartProduct> get cartItems; double get totalPrice; int get itemCount; CartStatus get actionStatus; String get actionError;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CartState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.error, _this.error) || other.error == _this.error)&&const DeepCollectionEquality().equals(other.cartItems, _this.cartItems)&&(identical(other.totalPrice, _this.totalPrice) || other.totalPrice == _this.totalPrice)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.actionStatus, _this.actionStatus) || other.actionStatus == _this.actionStatus)&&(identical(other.actionError, _this.actionError) || other.actionError == _this.actionError));
}


@override
int get hashCode {
  final _this = this as CartState;
  return Object.hash(runtimeType,_this.status,_this.error,const DeepCollectionEquality().hash(_this.cartItems),_this.totalPrice,_this.itemCount,_this.actionStatus,_this.actionError);
}

@override
String toString() {
  final _this = this as CartState;
  return 'CartState(status: ${_this.status}, error: ${_this.error}, cartItems: ${_this.cartItems}, totalPrice: ${_this.totalPrice}, itemCount: ${_this.itemCount}, actionStatus: ${_this.actionStatus}, actionError: ${_this.actionError})';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 CartStatus status, String error, List<CartProduct> cartItems, double totalPrice, int itemCount, CartStatus actionStatus, String actionError
});




}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? error = null,Object? cartItems = null,Object? totalPrice = null,Object? itemCount = null,Object? actionStatus = null,Object? actionError = null,}) {
  return _then(CartState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CartStatus,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<CartProduct>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as CartStatus,actionError: null == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CartStatus status,  String error,  List<CartProduct> cartItems,  double totalPrice,  int itemCount,  CartStatus actionStatus,  String actionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.status,_that.error,_that.cartItems,_that.totalPrice,_that.itemCount,_that.actionStatus,_that.actionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CartStatus status,  String error,  List<CartProduct> cartItems,  double totalPrice,  int itemCount,  CartStatus actionStatus,  String actionError)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.status,_that.error,_that.cartItems,_that.totalPrice,_that.itemCount,_that.actionStatus,_that.actionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CartStatus status,  String error,  List<CartProduct> cartItems,  double totalPrice,  int itemCount,  CartStatus actionStatus,  String actionError)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.status,_that.error,_that.cartItems,_that.totalPrice,_that.itemCount,_that.actionStatus,_that.actionError);case _:
  return null;

}
}

}

/// @nodoc


class _CartState implements CartState {
  const _CartState({this.status = CartStatus.initial, this.error = '',  List<CartProduct> cartItems = const [], this.totalPrice = 0.0, this.itemCount = 0, this.actionStatus = CartStatus.initial, this.actionError = ''}): _cartItems = cartItems;
  

@override@JsonKey() final  CartStatus status;
@override@JsonKey() final  String error;
 final  List<CartProduct> _cartItems;
@override@JsonKey() List<CartProduct> get cartItems {
  if (_cartItems is EqualUnmodifiableListView) return _cartItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartItems);
}

@override@JsonKey() final  double totalPrice;
@override@JsonKey() final  int itemCount;
@override@JsonKey() final  CartStatus actionStatus;
@override@JsonKey() final  String actionError;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.cartItems, _cartItems)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,error,const DeepCollectionEquality().hash(_cartItems),totalPrice,itemCount,actionStatus,actionError);
}

@override
String toString() {
    return 'CartState(status: $status, error: $error, cartItems: $cartItems, totalPrice: $totalPrice, itemCount: $itemCount, actionStatus: $actionStatus, actionError: $actionError)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 CartStatus status, String error, List<CartProduct> cartItems, double totalPrice, int itemCount, CartStatus actionStatus, String actionError
});




}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? error = null,Object? cartItems = null,Object? totalPrice = null,Object? itemCount = null,Object? actionStatus = null,Object? actionError = null,}) {
  return _then(_CartState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CartStatus,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,cartItems: null == cartItems ? _self._cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<CartProduct>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as CartStatus,actionError: null == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
