// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState<T> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginState<$T>()';
}


}

/// @nodoc
class $LoginStateCopyWith<T,$Res>  {
$LoginStateCopyWith(LoginState<T> _, $Res Function(LoginState<T>) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns<T> on LoginState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoginInitial<T> value)?  loginInitial,TResult Function( _LoginLoading<T> value)?  loginLoading,TResult Function( _LoginSuccess<T> value)?  loginSuccess,TResult Function( _LoginError<T> value)?  loginError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginInitial() when loginInitial != null:
return loginInitial(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _LoginError() when loginError != null:
return loginError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoginInitial<T> value)  loginInitial,required TResult Function( _LoginLoading<T> value)  loginLoading,required TResult Function( _LoginSuccess<T> value)  loginSuccess,required TResult Function( _LoginError<T> value)  loginError,}){
final _that = this;
switch (_that) {
case _LoginInitial():
return loginInitial(_that);case _LoginLoading():
return loginLoading(_that);case _LoginSuccess():
return loginSuccess(_that);case _LoginError():
return loginError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoginInitial<T> value)?  loginInitial,TResult? Function( _LoginLoading<T> value)?  loginLoading,TResult? Function( _LoginSuccess<T> value)?  loginSuccess,TResult? Function( _LoginError<T> value)?  loginError,}){
final _that = this;
switch (_that) {
case _LoginInitial() when loginInitial != null:
return loginInitial(_that);case _LoginLoading() when loginLoading != null:
return loginLoading(_that);case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case _LoginError() when loginError != null:
return loginError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loginInitial,TResult Function()?  loginLoading,TResult Function( T data)?  loginSuccess,TResult Function( String message)?  loginError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginInitial() when loginInitial != null:
return loginInitial();case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.data);case _LoginError() when loginError != null:
return loginError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loginInitial,required TResult Function()  loginLoading,required TResult Function( T data)  loginSuccess,required TResult Function( String message)  loginError,}) {final _that = this;
switch (_that) {
case _LoginInitial():
return loginInitial();case _LoginLoading():
return loginLoading();case _LoginSuccess():
return loginSuccess(_that.data);case _LoginError():
return loginError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loginInitial,TResult? Function()?  loginLoading,TResult? Function( T data)?  loginSuccess,TResult? Function( String message)?  loginError,}) {final _that = this;
switch (_that) {
case _LoginInitial() when loginInitial != null:
return loginInitial();case _LoginLoading() when loginLoading != null:
return loginLoading();case _LoginSuccess() when loginSuccess != null:
return loginSuccess(_that.data);case _LoginError() when loginError != null:
return loginError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _LoginInitial<T> implements LoginState<T> {
  const _LoginInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginState<$T>.loginInitial()';
}


}




/// @nodoc


class _LoginLoading<T> implements LoginState<T> {
  const _LoginLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginState<$T>.loginLoading()';
}


}




/// @nodoc


class _LoginSuccess<T> implements LoginState<T> {
  const _LoginSuccess(this.data);
  

 final  T data;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginSuccessCopyWith<T, _LoginSuccess<T>> get copyWith => __$LoginSuccessCopyWithImpl<T, _LoginSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'LoginState<$T>.loginSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$LoginSuccessCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory _$LoginSuccessCopyWith(_LoginSuccess<T> value, $Res Function(_LoginSuccess<T>) _then) = __$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$LoginSuccessCopyWithImpl<T,$Res>
    implements _$LoginSuccessCopyWith<T, $Res> {
  __$LoginSuccessCopyWithImpl(this._self, this._then);

  final _LoginSuccess<T> _self;
  final $Res Function(_LoginSuccess<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_LoginSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _LoginError<T> implements LoginState<T> {
  const _LoginError(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginErrorCopyWith<T, _LoginError<T>> get copyWith => __$LoginErrorCopyWithImpl<T, _LoginError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'LoginState<$T>.loginError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoginErrorCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory _$LoginErrorCopyWith(_LoginError<T> value, $Res Function(_LoginError<T>) _then) = __$LoginErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LoginErrorCopyWithImpl<T,$Res>
    implements _$LoginErrorCopyWith<T, $Res> {
  __$LoginErrorCopyWithImpl(this._self, this._then);

  final _LoginError<T> _self;
  final $Res Function(_LoginError<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LoginError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
