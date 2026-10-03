// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressState {

 AddressStatus get addAddressStatus; AddressStatus get getAddressStatus; AddressStatus get setDefaultAddressStatus; String get addAddressSuccessMessage; String get setDefaultAddressSuccessMessage; List<GetAddressResponse> get addresses; String get addAddressError; String get getAddressError; String get setDefaultAddressError; int? get defaultAddressId;
/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressStateCopyWith<AddressState> get copyWith => _$AddressStateCopyWithImpl<AddressState>(this as AddressState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AddressState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressState&&(identical(other.addAddressStatus, _this.addAddressStatus) || other.addAddressStatus == _this.addAddressStatus)&&(identical(other.getAddressStatus, _this.getAddressStatus) || other.getAddressStatus == _this.getAddressStatus)&&(identical(other.setDefaultAddressStatus, _this.setDefaultAddressStatus) || other.setDefaultAddressStatus == _this.setDefaultAddressStatus)&&(identical(other.addAddressSuccessMessage, _this.addAddressSuccessMessage) || other.addAddressSuccessMessage == _this.addAddressSuccessMessage)&&(identical(other.setDefaultAddressSuccessMessage, _this.setDefaultAddressSuccessMessage) || other.setDefaultAddressSuccessMessage == _this.setDefaultAddressSuccessMessage)&&const DeepCollectionEquality().equals(other.addresses, _this.addresses)&&(identical(other.addAddressError, _this.addAddressError) || other.addAddressError == _this.addAddressError)&&(identical(other.getAddressError, _this.getAddressError) || other.getAddressError == _this.getAddressError)&&(identical(other.setDefaultAddressError, _this.setDefaultAddressError) || other.setDefaultAddressError == _this.setDefaultAddressError)&&(identical(other.defaultAddressId, _this.defaultAddressId) || other.defaultAddressId == _this.defaultAddressId));
}


@override
int get hashCode {
  final _this = this as AddressState;
  return Object.hash(runtimeType,_this.addAddressStatus,_this.getAddressStatus,_this.setDefaultAddressStatus,_this.addAddressSuccessMessage,_this.setDefaultAddressSuccessMessage,const DeepCollectionEquality().hash(_this.addresses),_this.addAddressError,_this.getAddressError,_this.setDefaultAddressError,_this.defaultAddressId);
}

@override
String toString() {
  final _this = this as AddressState;
  return 'AddressState(addAddressStatus: ${_this.addAddressStatus}, getAddressStatus: ${_this.getAddressStatus}, setDefaultAddressStatus: ${_this.setDefaultAddressStatus}, addAddressSuccessMessage: ${_this.addAddressSuccessMessage}, setDefaultAddressSuccessMessage: ${_this.setDefaultAddressSuccessMessage}, addresses: ${_this.addresses}, addAddressError: ${_this.addAddressError}, getAddressError: ${_this.getAddressError}, setDefaultAddressError: ${_this.setDefaultAddressError}, defaultAddressId: ${_this.defaultAddressId})';
}


}

/// @nodoc
abstract mixin class $AddressStateCopyWith<$Res>  {
  factory $AddressStateCopyWith(AddressState value, $Res Function(AddressState) _then) = _$AddressStateCopyWithImpl;
@useResult
$Res call({
 AddressStatus addAddressStatus, AddressStatus getAddressStatus, AddressStatus setDefaultAddressStatus, String addAddressSuccessMessage, String setDefaultAddressSuccessMessage, List<GetAddressResponse> addresses, String addAddressError, String getAddressError, String setDefaultAddressError, int? defaultAddressId
});




}
/// @nodoc
class _$AddressStateCopyWithImpl<$Res>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._self, this._then);

  final AddressState _self;
  final $Res Function(AddressState) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addAddressStatus = null,Object? getAddressStatus = null,Object? setDefaultAddressStatus = null,Object? addAddressSuccessMessage = null,Object? setDefaultAddressSuccessMessage = null,Object? addresses = null,Object? addAddressError = null,Object? getAddressError = null,Object? setDefaultAddressError = null,Object? defaultAddressId = freezed,}) {
  return _then(AddressState(
addAddressStatus: null == addAddressStatus ? _self.addAddressStatus : addAddressStatus // ignore: cast_nullable_to_non_nullable
as AddressStatus,getAddressStatus: null == getAddressStatus ? _self.getAddressStatus : getAddressStatus // ignore: cast_nullable_to_non_nullable
as AddressStatus,setDefaultAddressStatus: null == setDefaultAddressStatus ? _self.setDefaultAddressStatus : setDefaultAddressStatus // ignore: cast_nullable_to_non_nullable
as AddressStatus,addAddressSuccessMessage: null == addAddressSuccessMessage ? _self.addAddressSuccessMessage : addAddressSuccessMessage // ignore: cast_nullable_to_non_nullable
as String,setDefaultAddressSuccessMessage: null == setDefaultAddressSuccessMessage ? _self.setDefaultAddressSuccessMessage : setDefaultAddressSuccessMessage // ignore: cast_nullable_to_non_nullable
as String,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<GetAddressResponse>,addAddressError: null == addAddressError ? _self.addAddressError : addAddressError // ignore: cast_nullable_to_non_nullable
as String,getAddressError: null == getAddressError ? _self.getAddressError : getAddressError // ignore: cast_nullable_to_non_nullable
as String,setDefaultAddressError: null == setDefaultAddressError ? _self.setDefaultAddressError : setDefaultAddressError // ignore: cast_nullable_to_non_nullable
as String,defaultAddressId: freezed == defaultAddressId ? _self.defaultAddressId : defaultAddressId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressState].
extension AddressStatePatterns on AddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressState value)  $default,){
final _that = this;
switch (_that) {
case _AddressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressState value)?  $default,){
final _that = this;
switch (_that) {
case _AddressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AddressStatus addAddressStatus,  AddressStatus getAddressStatus,  AddressStatus setDefaultAddressStatus,  String addAddressSuccessMessage,  String setDefaultAddressSuccessMessage,  List<GetAddressResponse> addresses,  String addAddressError,  String getAddressError,  String setDefaultAddressError,  int? defaultAddressId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.addAddressStatus,_that.getAddressStatus,_that.setDefaultAddressStatus,_that.addAddressSuccessMessage,_that.setDefaultAddressSuccessMessage,_that.addresses,_that.addAddressError,_that.getAddressError,_that.setDefaultAddressError,_that.defaultAddressId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AddressStatus addAddressStatus,  AddressStatus getAddressStatus,  AddressStatus setDefaultAddressStatus,  String addAddressSuccessMessage,  String setDefaultAddressSuccessMessage,  List<GetAddressResponse> addresses,  String addAddressError,  String getAddressError,  String setDefaultAddressError,  int? defaultAddressId)  $default,) {final _that = this;
switch (_that) {
case _AddressState():
return $default(_that.addAddressStatus,_that.getAddressStatus,_that.setDefaultAddressStatus,_that.addAddressSuccessMessage,_that.setDefaultAddressSuccessMessage,_that.addresses,_that.addAddressError,_that.getAddressError,_that.setDefaultAddressError,_that.defaultAddressId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AddressStatus addAddressStatus,  AddressStatus getAddressStatus,  AddressStatus setDefaultAddressStatus,  String addAddressSuccessMessage,  String setDefaultAddressSuccessMessage,  List<GetAddressResponse> addresses,  String addAddressError,  String getAddressError,  String setDefaultAddressError,  int? defaultAddressId)?  $default,) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.addAddressStatus,_that.getAddressStatus,_that.setDefaultAddressStatus,_that.addAddressSuccessMessage,_that.setDefaultAddressSuccessMessage,_that.addresses,_that.addAddressError,_that.getAddressError,_that.setDefaultAddressError,_that.defaultAddressId);case _:
  return null;

}
}

}

/// @nodoc


class _AddressState implements AddressState {
  const _AddressState({this.addAddressStatus = AddressStatus.initial, this.getAddressStatus = AddressStatus.initial, this.setDefaultAddressStatus = AddressStatus.initial, this.addAddressSuccessMessage = '', this.setDefaultAddressSuccessMessage = '',  List<GetAddressResponse> addresses = const [], this.addAddressError = '', this.getAddressError = '', this.setDefaultAddressError = '', this.defaultAddressId}): _addresses = addresses;
  

@override@JsonKey() final  AddressStatus addAddressStatus;
@override@JsonKey() final  AddressStatus getAddressStatus;
@override@JsonKey() final  AddressStatus setDefaultAddressStatus;
@override@JsonKey() final  String addAddressSuccessMessage;
@override@JsonKey() final  String setDefaultAddressSuccessMessage;
 final  List<GetAddressResponse> _addresses;
@override@JsonKey() List<GetAddressResponse> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

@override@JsonKey() final  String addAddressError;
@override@JsonKey() final  String getAddressError;
@override@JsonKey() final  String setDefaultAddressError;
@override final  int? defaultAddressId;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressStateCopyWith<_AddressState> get copyWith => __$AddressStateCopyWithImpl<_AddressState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressState&&(identical(other.addAddressStatus, addAddressStatus) || other.addAddressStatus == addAddressStatus)&&(identical(other.getAddressStatus, getAddressStatus) || other.getAddressStatus == getAddressStatus)&&(identical(other.setDefaultAddressStatus, setDefaultAddressStatus) || other.setDefaultAddressStatus == setDefaultAddressStatus)&&(identical(other.addAddressSuccessMessage, addAddressSuccessMessage) || other.addAddressSuccessMessage == addAddressSuccessMessage)&&(identical(other.setDefaultAddressSuccessMessage, setDefaultAddressSuccessMessage) || other.setDefaultAddressSuccessMessage == setDefaultAddressSuccessMessage)&&const DeepCollectionEquality().equals(other.addresses, _addresses)&&(identical(other.addAddressError, addAddressError) || other.addAddressError == addAddressError)&&(identical(other.getAddressError, getAddressError) || other.getAddressError == getAddressError)&&(identical(other.setDefaultAddressError, setDefaultAddressError) || other.setDefaultAddressError == setDefaultAddressError)&&(identical(other.defaultAddressId, defaultAddressId) || other.defaultAddressId == defaultAddressId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,addAddressStatus,getAddressStatus,setDefaultAddressStatus,addAddressSuccessMessage,setDefaultAddressSuccessMessage,const DeepCollectionEquality().hash(_addresses),addAddressError,getAddressError,setDefaultAddressError,defaultAddressId);
}

@override
String toString() {
    return 'AddressState(addAddressStatus: $addAddressStatus, getAddressStatus: $getAddressStatus, setDefaultAddressStatus: $setDefaultAddressStatus, addAddressSuccessMessage: $addAddressSuccessMessage, setDefaultAddressSuccessMessage: $setDefaultAddressSuccessMessage, addresses: $addresses, addAddressError: $addAddressError, getAddressError: $getAddressError, setDefaultAddressError: $setDefaultAddressError, defaultAddressId: $defaultAddressId)';
}


}

/// @nodoc
abstract mixin class _$AddressStateCopyWith<$Res> implements $AddressStateCopyWith<$Res> {
  factory _$AddressStateCopyWith(_AddressState value, $Res Function(_AddressState) _then) = __$AddressStateCopyWithImpl;
@override @useResult
$Res call({
 AddressStatus addAddressStatus, AddressStatus getAddressStatus, AddressStatus setDefaultAddressStatus, String addAddressSuccessMessage, String setDefaultAddressSuccessMessage, List<GetAddressResponse> addresses, String addAddressError, String getAddressError, String setDefaultAddressError, int? defaultAddressId
});




}
/// @nodoc
class __$AddressStateCopyWithImpl<$Res>
    implements _$AddressStateCopyWith<$Res> {
  __$AddressStateCopyWithImpl(this._self, this._then);

  final _AddressState _self;
  final $Res Function(_AddressState) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addAddressStatus = null,Object? getAddressStatus = null,Object? setDefaultAddressStatus = null,Object? addAddressSuccessMessage = null,Object? setDefaultAddressSuccessMessage = null,Object? addresses = null,Object? addAddressError = null,Object? getAddressError = null,Object? setDefaultAddressError = null,Object? defaultAddressId = freezed,}) {
  return _then(_AddressState(
addAddressStatus: null == addAddressStatus ? _self.addAddressStatus : addAddressStatus // ignore: cast_nullable_to_non_nullable
as AddressStatus,getAddressStatus: null == getAddressStatus ? _self.getAddressStatus : getAddressStatus // ignore: cast_nullable_to_non_nullable
as AddressStatus,setDefaultAddressStatus: null == setDefaultAddressStatus ? _self.setDefaultAddressStatus : setDefaultAddressStatus // ignore: cast_nullable_to_non_nullable
as AddressStatus,addAddressSuccessMessage: null == addAddressSuccessMessage ? _self.addAddressSuccessMessage : addAddressSuccessMessage // ignore: cast_nullable_to_non_nullable
as String,setDefaultAddressSuccessMessage: null == setDefaultAddressSuccessMessage ? _self.setDefaultAddressSuccessMessage : setDefaultAddressSuccessMessage // ignore: cast_nullable_to_non_nullable
as String,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<GetAddressResponse>,addAddressError: null == addAddressError ? _self.addAddressError : addAddressError // ignore: cast_nullable_to_non_nullable
as String,getAddressError: null == getAddressError ? _self.getAddressError : getAddressError // ignore: cast_nullable_to_non_nullable
as String,setDefaultAddressError: null == setDefaultAddressError ? _self.setDefaultAddressError : setDefaultAddressError // ignore: cast_nullable_to_non_nullable
as String,defaultAddressId: freezed == defaultAddressId ? _self.defaultAddressId : defaultAddressId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
