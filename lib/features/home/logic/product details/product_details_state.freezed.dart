// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailsState {

 ProductDetailsStatus get addToCartStatus; ProductDetailsStatus get toggleFavoriteStatus; String get toggleFavoriteErrorMessage; String get addToCartErrorMessage; int get amount; double get price; bool get isFavorite; Set<int> get selectedToppingIds;
/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsStateCopyWith<ProductDetailsState> get copyWith => _$ProductDetailsStateCopyWithImpl<ProductDetailsState>(this as ProductDetailsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProductDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsState&&(identical(other.addToCartStatus, _this.addToCartStatus) || other.addToCartStatus == _this.addToCartStatus)&&(identical(other.toggleFavoriteStatus, _this.toggleFavoriteStatus) || other.toggleFavoriteStatus == _this.toggleFavoriteStatus)&&(identical(other.toggleFavoriteErrorMessage, _this.toggleFavoriteErrorMessage) || other.toggleFavoriteErrorMessage == _this.toggleFavoriteErrorMessage)&&(identical(other.addToCartErrorMessage, _this.addToCartErrorMessage) || other.addToCartErrorMessage == _this.addToCartErrorMessage)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.isFavorite, _this.isFavorite) || other.isFavorite == _this.isFavorite)&&const DeepCollectionEquality().equals(other.selectedToppingIds, _this.selectedToppingIds));
}


@override
int get hashCode {
  final _this = this as ProductDetailsState;
  return Object.hash(runtimeType,_this.addToCartStatus,_this.toggleFavoriteStatus,_this.toggleFavoriteErrorMessage,_this.addToCartErrorMessage,_this.amount,_this.price,_this.isFavorite,const DeepCollectionEquality().hash(_this.selectedToppingIds));
}

@override
String toString() {
  final _this = this as ProductDetailsState;
  return 'ProductDetailsState(addToCartStatus: ${_this.addToCartStatus}, toggleFavoriteStatus: ${_this.toggleFavoriteStatus}, toggleFavoriteErrorMessage: ${_this.toggleFavoriteErrorMessage}, addToCartErrorMessage: ${_this.addToCartErrorMessage}, amount: ${_this.amount}, price: ${_this.price}, isFavorite: ${_this.isFavorite}, selectedToppingIds: ${_this.selectedToppingIds})';
}


}

/// @nodoc
abstract mixin class $ProductDetailsStateCopyWith<$Res>  {
  factory $ProductDetailsStateCopyWith(ProductDetailsState value, $Res Function(ProductDetailsState) _then) = _$ProductDetailsStateCopyWithImpl;
@useResult
$Res call({
 ProductDetailsStatus addToCartStatus, ProductDetailsStatus toggleFavoriteStatus, String toggleFavoriteErrorMessage, String addToCartErrorMessage, int amount, double price, bool isFavorite, Set<int> selectedToppingIds
});




}
/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final ProductDetailsState _self;
  final $Res Function(ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addToCartStatus = null,Object? toggleFavoriteStatus = null,Object? toggleFavoriteErrorMessage = null,Object? addToCartErrorMessage = null,Object? amount = null,Object? price = null,Object? isFavorite = null,Object? selectedToppingIds = null,}) {
  return _then(ProductDetailsState(
addToCartStatus: null == addToCartStatus ? _self.addToCartStatus : addToCartStatus // ignore: cast_nullable_to_non_nullable
as ProductDetailsStatus,toggleFavoriteStatus: null == toggleFavoriteStatus ? _self.toggleFavoriteStatus : toggleFavoriteStatus // ignore: cast_nullable_to_non_nullable
as ProductDetailsStatus,toggleFavoriteErrorMessage: null == toggleFavoriteErrorMessage ? _self.toggleFavoriteErrorMessage : toggleFavoriteErrorMessage // ignore: cast_nullable_to_non_nullable
as String,addToCartErrorMessage: null == addToCartErrorMessage ? _self.addToCartErrorMessage : addToCartErrorMessage // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,selectedToppingIds: null == selectedToppingIds ? _self.selectedToppingIds : selectedToppingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailsState].
extension ProductDetailsStatePatterns on ProductDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductDetailsStatus addToCartStatus,  ProductDetailsStatus toggleFavoriteStatus,  String toggleFavoriteErrorMessage,  String addToCartErrorMessage,  int amount,  double price,  bool isFavorite,  Set<int> selectedToppingIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.addToCartStatus,_that.toggleFavoriteStatus,_that.toggleFavoriteErrorMessage,_that.addToCartErrorMessage,_that.amount,_that.price,_that.isFavorite,_that.selectedToppingIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductDetailsStatus addToCartStatus,  ProductDetailsStatus toggleFavoriteStatus,  String toggleFavoriteErrorMessage,  String addToCartErrorMessage,  int amount,  double price,  bool isFavorite,  Set<int> selectedToppingIds)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState():
return $default(_that.addToCartStatus,_that.toggleFavoriteStatus,_that.toggleFavoriteErrorMessage,_that.addToCartErrorMessage,_that.amount,_that.price,_that.isFavorite,_that.selectedToppingIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductDetailsStatus addToCartStatus,  ProductDetailsStatus toggleFavoriteStatus,  String toggleFavoriteErrorMessage,  String addToCartErrorMessage,  int amount,  double price,  bool isFavorite,  Set<int> selectedToppingIds)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailsState() when $default != null:
return $default(_that.addToCartStatus,_that.toggleFavoriteStatus,_that.toggleFavoriteErrorMessage,_that.addToCartErrorMessage,_that.amount,_that.price,_that.isFavorite,_that.selectedToppingIds);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailsState implements ProductDetailsState {
  const _ProductDetailsState({this.addToCartStatus = ProductDetailsStatus.initial, this.toggleFavoriteStatus = ProductDetailsStatus.initial, this.toggleFavoriteErrorMessage = '', this.addToCartErrorMessage = '', this.amount = 1, this.price = 0.0, this.isFavorite = false,  Set<int> selectedToppingIds = const <int>{}}): _selectedToppingIds = selectedToppingIds;
  

@override@JsonKey() final  ProductDetailsStatus addToCartStatus;
@override@JsonKey() final  ProductDetailsStatus toggleFavoriteStatus;
@override@JsonKey() final  String toggleFavoriteErrorMessage;
@override@JsonKey() final  String addToCartErrorMessage;
@override@JsonKey() final  int amount;
@override@JsonKey() final  double price;
@override@JsonKey() final  bool isFavorite;
 final  Set<int> _selectedToppingIds;
@override@JsonKey() Set<int> get selectedToppingIds {
  if (_selectedToppingIds is EqualUnmodifiableSetView) return _selectedToppingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedToppingIds);
}


/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailsStateCopyWith<_ProductDetailsState> get copyWith => __$ProductDetailsStateCopyWithImpl<_ProductDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailsState&&(identical(other.addToCartStatus, addToCartStatus) || other.addToCartStatus == addToCartStatus)&&(identical(other.toggleFavoriteStatus, toggleFavoriteStatus) || other.toggleFavoriteStatus == toggleFavoriteStatus)&&(identical(other.toggleFavoriteErrorMessage, toggleFavoriteErrorMessage) || other.toggleFavoriteErrorMessage == toggleFavoriteErrorMessage)&&(identical(other.addToCartErrorMessage, addToCartErrorMessage) || other.addToCartErrorMessage == addToCartErrorMessage)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other.selectedToppingIds, _selectedToppingIds));
}


@override
int get hashCode {
    return Object.hash(runtimeType,addToCartStatus,toggleFavoriteStatus,toggleFavoriteErrorMessage,addToCartErrorMessage,amount,price,isFavorite,const DeepCollectionEquality().hash(_selectedToppingIds));
}

@override
String toString() {
    return 'ProductDetailsState(addToCartStatus: $addToCartStatus, toggleFavoriteStatus: $toggleFavoriteStatus, toggleFavoriteErrorMessage: $toggleFavoriteErrorMessage, addToCartErrorMessage: $addToCartErrorMessage, amount: $amount, price: $price, isFavorite: $isFavorite, selectedToppingIds: $selectedToppingIds)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailsStateCopyWith<$Res> implements $ProductDetailsStateCopyWith<$Res> {
  factory _$ProductDetailsStateCopyWith(_ProductDetailsState value, $Res Function(_ProductDetailsState) _then) = __$ProductDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 ProductDetailsStatus addToCartStatus, ProductDetailsStatus toggleFavoriteStatus, String toggleFavoriteErrorMessage, String addToCartErrorMessage, int amount, double price, bool isFavorite, Set<int> selectedToppingIds
});




}
/// @nodoc
class __$ProductDetailsStateCopyWithImpl<$Res>
    implements _$ProductDetailsStateCopyWith<$Res> {
  __$ProductDetailsStateCopyWithImpl(this._self, this._then);

  final _ProductDetailsState _self;
  final $Res Function(_ProductDetailsState) _then;

/// Create a copy of ProductDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addToCartStatus = null,Object? toggleFavoriteStatus = null,Object? toggleFavoriteErrorMessage = null,Object? addToCartErrorMessage = null,Object? amount = null,Object? price = null,Object? isFavorite = null,Object? selectedToppingIds = null,}) {
  return _then(_ProductDetailsState(
addToCartStatus: null == addToCartStatus ? _self.addToCartStatus : addToCartStatus // ignore: cast_nullable_to_non_nullable
as ProductDetailsStatus,toggleFavoriteStatus: null == toggleFavoriteStatus ? _self.toggleFavoriteStatus : toggleFavoriteStatus // ignore: cast_nullable_to_non_nullable
as ProductDetailsStatus,toggleFavoriteErrorMessage: null == toggleFavoriteErrorMessage ? _self.toggleFavoriteErrorMessage : toggleFavoriteErrorMessage // ignore: cast_nullable_to_non_nullable
as String,addToCartErrorMessage: null == addToCartErrorMessage ? _self.addToCartErrorMessage : addToCartErrorMessage // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,selectedToppingIds: null == selectedToppingIds ? _self._selectedToppingIds : selectedToppingIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
