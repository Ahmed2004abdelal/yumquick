// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentState {

 PaymentFlowStatus get cardsStatus; List<SavedCardModel> get cards; String get cardsError; int? get selectedCardId; PaymentFlowStatus get saveCardStatus; String get saveCardError;
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStateCopyWith<PaymentState> get copyWith => _$PaymentStateCopyWithImpl<PaymentState>(this as PaymentState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaymentState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState&&(identical(other.cardsStatus, _this.cardsStatus) || other.cardsStatus == _this.cardsStatus)&&const DeepCollectionEquality().equals(other.cards, _this.cards)&&(identical(other.cardsError, _this.cardsError) || other.cardsError == _this.cardsError)&&(identical(other.selectedCardId, _this.selectedCardId) || other.selectedCardId == _this.selectedCardId)&&(identical(other.saveCardStatus, _this.saveCardStatus) || other.saveCardStatus == _this.saveCardStatus)&&(identical(other.saveCardError, _this.saveCardError) || other.saveCardError == _this.saveCardError));
}


@override
int get hashCode {
  final _this = this as PaymentState;
  return Object.hash(runtimeType,_this.cardsStatus,const DeepCollectionEquality().hash(_this.cards),_this.cardsError,_this.selectedCardId,_this.saveCardStatus,_this.saveCardError);
}

@override
String toString() {
  final _this = this as PaymentState;
  return 'PaymentState(cardsStatus: ${_this.cardsStatus}, cards: ${_this.cards}, cardsError: ${_this.cardsError}, selectedCardId: ${_this.selectedCardId}, saveCardStatus: ${_this.saveCardStatus}, saveCardError: ${_this.saveCardError})';
}


}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res>  {
  factory $PaymentStateCopyWith(PaymentState value, $Res Function(PaymentState) _then) = _$PaymentStateCopyWithImpl;
@useResult
$Res call({
 PaymentFlowStatus cardsStatus, List<SavedCardModel> cards, String cardsError, int? selectedCardId, PaymentFlowStatus saveCardStatus, String saveCardError
});




}
/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardsStatus = null,Object? cards = null,Object? cardsError = null,Object? selectedCardId = freezed,Object? saveCardStatus = null,Object? saveCardError = null,}) {
  return _then(PaymentState(
cardsStatus: null == cardsStatus ? _self.cardsStatus : cardsStatus // ignore: cast_nullable_to_non_nullable
as PaymentFlowStatus,cards: null == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as List<SavedCardModel>,cardsError: null == cardsError ? _self.cardsError : cardsError // ignore: cast_nullable_to_non_nullable
as String,selectedCardId: freezed == selectedCardId ? _self.selectedCardId : selectedCardId // ignore: cast_nullable_to_non_nullable
as int?,saveCardStatus: null == saveCardStatus ? _self.saveCardStatus : saveCardStatus // ignore: cast_nullable_to_non_nullable
as PaymentFlowStatus,saveCardError: null == saveCardError ? _self.saveCardError : saveCardError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentFlowStatus cardsStatus,  List<SavedCardModel> cards,  String cardsError,  int? selectedCardId,  PaymentFlowStatus saveCardStatus,  String saveCardError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.cardsStatus,_that.cards,_that.cardsError,_that.selectedCardId,_that.saveCardStatus,_that.saveCardError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentFlowStatus cardsStatus,  List<SavedCardModel> cards,  String cardsError,  int? selectedCardId,  PaymentFlowStatus saveCardStatus,  String saveCardError)  $default,) {final _that = this;
switch (_that) {
case _PaymentState():
return $default(_that.cardsStatus,_that.cards,_that.cardsError,_that.selectedCardId,_that.saveCardStatus,_that.saveCardError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentFlowStatus cardsStatus,  List<SavedCardModel> cards,  String cardsError,  int? selectedCardId,  PaymentFlowStatus saveCardStatus,  String saveCardError)?  $default,) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.cardsStatus,_that.cards,_that.cardsError,_that.selectedCardId,_that.saveCardStatus,_that.saveCardError);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentState implements PaymentState {
  const _PaymentState({this.cardsStatus = PaymentFlowStatus.initial,  List<SavedCardModel> cards = const [], this.cardsError = '', this.selectedCardId, this.saveCardStatus = PaymentFlowStatus.initial, this.saveCardError = ''}): _cards = cards;
  

@override@JsonKey() final  PaymentFlowStatus cardsStatus;
 final  List<SavedCardModel> _cards;
@override@JsonKey() List<SavedCardModel> get cards {
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cards);
}

@override@JsonKey() final  String cardsError;
@override final  int? selectedCardId;
@override@JsonKey() final  PaymentFlowStatus saveCardStatus;
@override@JsonKey() final  String saveCardError;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStateCopyWith<_PaymentState> get copyWith => __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentState&&(identical(other.cardsStatus, cardsStatus) || other.cardsStatus == cardsStatus)&&const DeepCollectionEquality().equals(other.cards, _cards)&&(identical(other.cardsError, cardsError) || other.cardsError == cardsError)&&(identical(other.selectedCardId, selectedCardId) || other.selectedCardId == selectedCardId)&&(identical(other.saveCardStatus, saveCardStatus) || other.saveCardStatus == saveCardStatus)&&(identical(other.saveCardError, saveCardError) || other.saveCardError == saveCardError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,cardsStatus,const DeepCollectionEquality().hash(_cards),cardsError,selectedCardId,saveCardStatus,saveCardError);
}

@override
String toString() {
    return 'PaymentState(cardsStatus: $cardsStatus, cards: $cards, cardsError: $cardsError, selectedCardId: $selectedCardId, saveCardStatus: $saveCardStatus, saveCardError: $saveCardError)';
}


}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(_PaymentState value, $Res Function(_PaymentState) _then) = __$PaymentStateCopyWithImpl;
@override @useResult
$Res call({
 PaymentFlowStatus cardsStatus, List<SavedCardModel> cards, String cardsError, int? selectedCardId, PaymentFlowStatus saveCardStatus, String saveCardError
});




}
/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardsStatus = null,Object? cards = null,Object? cardsError = null,Object? selectedCardId = freezed,Object? saveCardStatus = null,Object? saveCardError = null,}) {
  return _then(_PaymentState(
cardsStatus: null == cardsStatus ? _self.cardsStatus : cardsStatus // ignore: cast_nullable_to_non_nullable
as PaymentFlowStatus,cards: null == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<SavedCardModel>,cardsError: null == cardsError ? _self.cardsError : cardsError // ignore: cast_nullable_to_non_nullable
as String,selectedCardId: freezed == selectedCardId ? _self.selectedCardId : selectedCardId // ignore: cast_nullable_to_non_nullable
as int?,saveCardStatus: null == saveCardStatus ? _self.saveCardStatus : saveCardStatus // ignore: cast_nullable_to_non_nullable
as PaymentFlowStatus,saveCardError: null == saveCardError ? _self.saveCardError : saveCardError // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
