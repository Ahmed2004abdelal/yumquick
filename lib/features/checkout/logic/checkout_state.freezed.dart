// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {

 CheckoutStatus get checkoutStatus; CheckoutStatus get actionStatus; CheckoutStatus get paymentStatus; CheckoutResponse? get checkoutSuccessResponse; List<CartProduct> get products; double get totalPrice; String get checkoutError; String get paymentError; bool get cashPaymentSelected; SavedCardModel? get selectedCard; GetAddressResponse? get address;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CheckoutState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.checkoutStatus, _this.checkoutStatus) || other.checkoutStatus == _this.checkoutStatus)&&(identical(other.actionStatus, _this.actionStatus) || other.actionStatus == _this.actionStatus)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.checkoutSuccessResponse, _this.checkoutSuccessResponse) || other.checkoutSuccessResponse == _this.checkoutSuccessResponse)&&const DeepCollectionEquality().equals(other.products, _this.products)&&(identical(other.totalPrice, _this.totalPrice) || other.totalPrice == _this.totalPrice)&&(identical(other.checkoutError, _this.checkoutError) || other.checkoutError == _this.checkoutError)&&(identical(other.paymentError, _this.paymentError) || other.paymentError == _this.paymentError)&&(identical(other.cashPaymentSelected, _this.cashPaymentSelected) || other.cashPaymentSelected == _this.cashPaymentSelected)&&(identical(other.selectedCard, _this.selectedCard) || other.selectedCard == _this.selectedCard)&&(identical(other.address, _this.address) || other.address == _this.address));
}


@override
int get hashCode {
  final _this = this as CheckoutState;
  return Object.hash(runtimeType,_this.checkoutStatus,_this.actionStatus,_this.paymentStatus,_this.checkoutSuccessResponse,const DeepCollectionEquality().hash(_this.products),_this.totalPrice,_this.checkoutError,_this.paymentError,_this.cashPaymentSelected,_this.selectedCard,_this.address);
}

@override
String toString() {
  final _this = this as CheckoutState;
  return 'CheckoutState(checkoutStatus: ${_this.checkoutStatus}, actionStatus: ${_this.actionStatus}, paymentStatus: ${_this.paymentStatus}, checkoutSuccessResponse: ${_this.checkoutSuccessResponse}, products: ${_this.products}, totalPrice: ${_this.totalPrice}, checkoutError: ${_this.checkoutError}, paymentError: ${_this.paymentError}, cashPaymentSelected: ${_this.cashPaymentSelected}, selectedCard: ${_this.selectedCard}, address: ${_this.address})';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 CheckoutStatus checkoutStatus, CheckoutStatus actionStatus, CheckoutStatus paymentStatus, CheckoutResponse? checkoutSuccessResponse, List<CartProduct> products, double totalPrice, String checkoutError, String paymentError, bool cashPaymentSelected, SavedCardModel? selectedCard, GetAddressResponse? address
});




}
/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkoutStatus = null,Object? actionStatus = null,Object? paymentStatus = null,Object? checkoutSuccessResponse = freezed,Object? products = null,Object? totalPrice = null,Object? checkoutError = null,Object? paymentError = null,Object? cashPaymentSelected = null,Object? selectedCard = freezed,Object? address = freezed,}) {
  return _then(CheckoutState(
checkoutStatus: null == checkoutStatus ? _self.checkoutStatus : checkoutStatus // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,checkoutSuccessResponse: freezed == checkoutSuccessResponse ? _self.checkoutSuccessResponse : checkoutSuccessResponse // ignore: cast_nullable_to_non_nullable
as CheckoutResponse?,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<CartProduct>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,checkoutError: null == checkoutError ? _self.checkoutError : checkoutError // ignore: cast_nullable_to_non_nullable
as String,paymentError: null == paymentError ? _self.paymentError : paymentError // ignore: cast_nullable_to_non_nullable
as String,cashPaymentSelected: null == cashPaymentSelected ? _self.cashPaymentSelected : cashPaymentSelected // ignore: cast_nullable_to_non_nullable
as bool,selectedCard: freezed == selectedCard ? _self.selectedCard : selectedCard // ignore: cast_nullable_to_non_nullable
as SavedCardModel?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as GetAddressResponse?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutState value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutState value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckoutStatus checkoutStatus,  CheckoutStatus actionStatus,  CheckoutStatus paymentStatus,  CheckoutResponse? checkoutSuccessResponse,  List<CartProduct> products,  double totalPrice,  String checkoutError,  String paymentError,  bool cashPaymentSelected,  SavedCardModel? selectedCard,  GetAddressResponse? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.checkoutStatus,_that.actionStatus,_that.paymentStatus,_that.checkoutSuccessResponse,_that.products,_that.totalPrice,_that.checkoutError,_that.paymentError,_that.cashPaymentSelected,_that.selectedCard,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckoutStatus checkoutStatus,  CheckoutStatus actionStatus,  CheckoutStatus paymentStatus,  CheckoutResponse? checkoutSuccessResponse,  List<CartProduct> products,  double totalPrice,  String checkoutError,  String paymentError,  bool cashPaymentSelected,  SavedCardModel? selectedCard,  GetAddressResponse? address)  $default,) {final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that.checkoutStatus,_that.actionStatus,_that.paymentStatus,_that.checkoutSuccessResponse,_that.products,_that.totalPrice,_that.checkoutError,_that.paymentError,_that.cashPaymentSelected,_that.selectedCard,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckoutStatus checkoutStatus,  CheckoutStatus actionStatus,  CheckoutStatus paymentStatus,  CheckoutResponse? checkoutSuccessResponse,  List<CartProduct> products,  double totalPrice,  String checkoutError,  String paymentError,  bool cashPaymentSelected,  SavedCardModel? selectedCard,  GetAddressResponse? address)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.checkoutStatus,_that.actionStatus,_that.paymentStatus,_that.checkoutSuccessResponse,_that.products,_that.totalPrice,_that.checkoutError,_that.paymentError,_that.cashPaymentSelected,_that.selectedCard,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutState implements CheckoutState {
  const _CheckoutState({this.checkoutStatus = CheckoutStatus.initial, this.actionStatus = CheckoutStatus.initial, this.paymentStatus = CheckoutStatus.initial, this.checkoutSuccessResponse,  List<CartProduct> products = const [], this.totalPrice = 0.0, this.checkoutError = '', this.paymentError = '', this.cashPaymentSelected = true, this.selectedCard, this.address}): _products = products;
  

@override@JsonKey() final  CheckoutStatus checkoutStatus;
@override@JsonKey() final  CheckoutStatus actionStatus;
@override@JsonKey() final  CheckoutStatus paymentStatus;
@override final  CheckoutResponse? checkoutSuccessResponse;
 final  List<CartProduct> _products;
@override@JsonKey() List<CartProduct> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  double totalPrice;
@override@JsonKey() final  String checkoutError;
@override@JsonKey() final  String paymentError;
@override@JsonKey() final  bool cashPaymentSelected;
@override final  SavedCardModel? selectedCard;
@override final  GetAddressResponse? address;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.checkoutStatus, checkoutStatus) || other.checkoutStatus == checkoutStatus)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.checkoutSuccessResponse, checkoutSuccessResponse) || other.checkoutSuccessResponse == checkoutSuccessResponse)&&const DeepCollectionEquality().equals(other.products, _products)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.checkoutError, checkoutError) || other.checkoutError == checkoutError)&&(identical(other.paymentError, paymentError) || other.paymentError == paymentError)&&(identical(other.cashPaymentSelected, cashPaymentSelected) || other.cashPaymentSelected == cashPaymentSelected)&&(identical(other.selectedCard, selectedCard) || other.selectedCard == selectedCard)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode {
    return Object.hash(runtimeType,checkoutStatus,actionStatus,paymentStatus,checkoutSuccessResponse,const DeepCollectionEquality().hash(_products),totalPrice,checkoutError,paymentError,cashPaymentSelected,selectedCard,address);
}

@override
String toString() {
    return 'CheckoutState(checkoutStatus: $checkoutStatus, actionStatus: $actionStatus, paymentStatus: $paymentStatus, checkoutSuccessResponse: $checkoutSuccessResponse, products: $products, totalPrice: $totalPrice, checkoutError: $checkoutError, paymentError: $paymentError, cashPaymentSelected: $cashPaymentSelected, selectedCard: $selectedCard, address: $address)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 CheckoutStatus checkoutStatus, CheckoutStatus actionStatus, CheckoutStatus paymentStatus, CheckoutResponse? checkoutSuccessResponse, List<CartProduct> products, double totalPrice, String checkoutError, String paymentError, bool cashPaymentSelected, SavedCardModel? selectedCard, GetAddressResponse? address
});




}
/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkoutStatus = null,Object? actionStatus = null,Object? paymentStatus = null,Object? checkoutSuccessResponse = freezed,Object? products = null,Object? totalPrice = null,Object? checkoutError = null,Object? paymentError = null,Object? cashPaymentSelected = null,Object? selectedCard = freezed,Object? address = freezed,}) {
  return _then(_CheckoutState(
checkoutStatus: null == checkoutStatus ? _self.checkoutStatus : checkoutStatus // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,checkoutSuccessResponse: freezed == checkoutSuccessResponse ? _self.checkoutSuccessResponse : checkoutSuccessResponse // ignore: cast_nullable_to_non_nullable
as CheckoutResponse?,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<CartProduct>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,checkoutError: null == checkoutError ? _self.checkoutError : checkoutError // ignore: cast_nullable_to_non_nullable
as String,paymentError: null == paymentError ? _self.paymentError : paymentError // ignore: cast_nullable_to_non_nullable
as String,cashPaymentSelected: null == cashPaymentSelected ? _self.cashPaymentSelected : cashPaymentSelected // ignore: cast_nullable_to_non_nullable
as bool,selectedCard: freezed == selectedCard ? _self.selectedCard : selectedCard // ignore: cast_nullable_to_non_nullable
as SavedCardModel?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as GetAddressResponse?,
  ));
}


}

// dart format on
