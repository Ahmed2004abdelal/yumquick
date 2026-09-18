// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState<T> {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignupState<$T>()';
}


}

/// @nodoc
class $SignupStateCopyWith<T,$Res>  {
$SignupStateCopyWith(SignupState<T> _, $Res Function(SignupState<T>) __);
}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns<T> on SignupState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SignInitial<T> value)?  signInitial,TResult Function( _SignupLoading<T> value)?  signLoading,TResult Function( _SignupSuccess<T> value)?  signSuccess,TResult Function( _SignupError<T> value)?  signError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInitial() when signInitial != null:
return signInitial(_that);case _SignupLoading() when signLoading != null:
return signLoading(_that);case _SignupSuccess() when signSuccess != null:
return signSuccess(_that);case _SignupError() when signError != null:
return signError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SignInitial<T> value)  signInitial,required TResult Function( _SignupLoading<T> value)  signLoading,required TResult Function( _SignupSuccess<T> value)  signSuccess,required TResult Function( _SignupError<T> value)  signError,}){
final _that = this;
switch (_that) {
case _SignInitial():
return signInitial(_that);case _SignupLoading():
return signLoading(_that);case _SignupSuccess():
return signSuccess(_that);case _SignupError():
return signError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SignInitial<T> value)?  signInitial,TResult? Function( _SignupLoading<T> value)?  signLoading,TResult? Function( _SignupSuccess<T> value)?  signSuccess,TResult? Function( _SignupError<T> value)?  signError,}){
final _that = this;
switch (_that) {
case _SignInitial() when signInitial != null:
return signInitial(_that);case _SignupLoading() when signLoading != null:
return signLoading(_that);case _SignupSuccess() when signSuccess != null:
return signSuccess(_that);case _SignupError() when signError != null:
return signError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  signInitial,TResult Function()?  signLoading,TResult Function( T data)?  signSuccess,TResult Function( String message)?  signError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInitial() when signInitial != null:
return signInitial();case _SignupLoading() when signLoading != null:
return signLoading();case _SignupSuccess() when signSuccess != null:
return signSuccess(_that.data);case _SignupError() when signError != null:
return signError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  signInitial,required TResult Function()  signLoading,required TResult Function( T data)  signSuccess,required TResult Function( String message)  signError,}) {final _that = this;
switch (_that) {
case _SignInitial():
return signInitial();case _SignupLoading():
return signLoading();case _SignupSuccess():
return signSuccess(_that.data);case _SignupError():
return signError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  signInitial,TResult? Function()?  signLoading,TResult? Function( T data)?  signSuccess,TResult? Function( String message)?  signError,}) {final _that = this;
switch (_that) {
case _SignInitial() when signInitial != null:
return signInitial();case _SignupLoading() when signLoading != null:
return signLoading();case _SignupSuccess() when signSuccess != null:
return signSuccess(_that.data);case _SignupError() when signError != null:
return signError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SignInitial<T> implements SignupState<T> {
  const _SignInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignupState<$T>.signInitial()';
}


}




/// @nodoc


class _SignupLoading<T> implements SignupState<T> {
  const _SignupLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SignupState<$T>.signLoading()';
}


}




/// @nodoc


class _SignupSuccess<T> implements SignupState<T> {
  const _SignupSuccess(this.data);
  

 final  T data;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupSuccessCopyWith<T, _SignupSuccess<T>> get copyWith => __$SignupSuccessCopyWithImpl<T, _SignupSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'SignupState<$T>.signSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SignupSuccessCopyWith<T,$Res> implements $SignupStateCopyWith<T, $Res> {
  factory _$SignupSuccessCopyWith(_SignupSuccess<T> value, $Res Function(_SignupSuccess<T>) _then) = __$SignupSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class __$SignupSuccessCopyWithImpl<T,$Res>
    implements _$SignupSuccessCopyWith<T, $Res> {
  __$SignupSuccessCopyWithImpl(this._self, this._then);

  final _SignupSuccess<T> _self;
  final $Res Function(_SignupSuccess<T>) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_SignupSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _SignupError<T> implements SignupState<T> {
  const _SignupError(this.message);
  

 final  String message;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupErrorCopyWith<T, _SignupError<T>> get copyWith => __$SignupErrorCopyWithImpl<T, _SignupError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SignupState<$T>.signError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SignupErrorCopyWith<T,$Res> implements $SignupStateCopyWith<T, $Res> {
  factory _$SignupErrorCopyWith(_SignupError<T> value, $Res Function(_SignupError<T>) _then) = __$SignupErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SignupErrorCopyWithImpl<T,$Res>
    implements _$SignupErrorCopyWith<T, $Res> {
  __$SignupErrorCopyWithImpl(this._self, this._then);

  final _SignupError<T> _self;
  final $Res Function(_SignupError<T>) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SignupError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
