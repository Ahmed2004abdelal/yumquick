// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_messages_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IssueMessagesModel {

 int get id; String get subject; int get status; int get orderId; DateTime get createdAt; List<MessagesModel> get messages;
/// Create a copy of IssueMessagesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueMessagesModelCopyWith<IssueMessagesModel> get copyWith => _$IssueMessagesModelCopyWithImpl<IssueMessagesModel>(this as IssueMessagesModel, _$identity);

  /// Serializes this IssueMessagesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IssueMessagesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueMessagesModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.subject, _this.subject) || other.subject == _this.subject)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&const DeepCollectionEquality().equals(other.messages, _this.messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IssueMessagesModel;
  return Object.hash(runtimeType,_this.id,_this.subject,_this.status,_this.orderId,_this.createdAt,const DeepCollectionEquality().hash(_this.messages));
}

@override
String toString() {
  final _this = this as IssueMessagesModel;
  return 'IssueMessagesModel(id: ${_this.id}, subject: ${_this.subject}, status: ${_this.status}, orderId: ${_this.orderId}, createdAt: ${_this.createdAt}, messages: ${_this.messages})';
}


}

/// @nodoc
abstract mixin class $IssueMessagesModelCopyWith<$Res>  {
  factory $IssueMessagesModelCopyWith(IssueMessagesModel value, $Res Function(IssueMessagesModel) _then) = _$IssueMessagesModelCopyWithImpl;
@useResult
$Res call({
 int id, String subject, int status, int orderId, DateTime createdAt, List<MessagesModel> messages
});




}
/// @nodoc
class _$IssueMessagesModelCopyWithImpl<$Res>
    implements $IssueMessagesModelCopyWith<$Res> {
  _$IssueMessagesModelCopyWithImpl(this._self, this._then);

  final IssueMessagesModel _self;
  final $Res Function(IssueMessagesModel) _then;

/// Create a copy of IssueMessagesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? subject = null,Object? status = null,Object? orderId = null,Object? createdAt = null,Object? messages = null,}) {
  return _then(IssueMessagesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessagesModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueMessagesModel].
extension IssueMessagesModelPatterns on IssueMessagesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueMessagesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueMessagesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueMessagesModel value)  $default,){
final _that = this;
switch (_that) {
case _IssueMessagesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueMessagesModel value)?  $default,){
final _that = this;
switch (_that) {
case _IssueMessagesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String subject,  int status,  int orderId,  DateTime createdAt,  List<MessagesModel> messages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueMessagesModel() when $default != null:
return $default(_that.id,_that.subject,_that.status,_that.orderId,_that.createdAt,_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String subject,  int status,  int orderId,  DateTime createdAt,  List<MessagesModel> messages)  $default,) {final _that = this;
switch (_that) {
case _IssueMessagesModel():
return $default(_that.id,_that.subject,_that.status,_that.orderId,_that.createdAt,_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String subject,  int status,  int orderId,  DateTime createdAt,  List<MessagesModel> messages)?  $default,) {final _that = this;
switch (_that) {
case _IssueMessagesModel() when $default != null:
return $default(_that.id,_that.subject,_that.status,_that.orderId,_that.createdAt,_that.messages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssueMessagesModel implements IssueMessagesModel {
  const _IssueMessagesModel({required this.id, required this.subject, required this.status, required this.orderId, required this.createdAt, required  List<MessagesModel> messages}): _messages = messages;
  factory _IssueMessagesModel.fromJson(Map<String, dynamic> json) => _$IssueMessagesModelFromJson(json);

@override final  int id;
@override final  String subject;
@override final  int status;
@override final  int orderId;
@override final  DateTime createdAt;
 final  List<MessagesModel> _messages;
@override List<MessagesModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of IssueMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueMessagesModelCopyWith<_IssueMessagesModel> get copyWith => __$IssueMessagesModelCopyWithImpl<_IssueMessagesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssueMessagesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueMessagesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.status, status) || other.status == status)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.messages, _messages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,subject,status,orderId,createdAt,const DeepCollectionEquality().hash(_messages));
}

@override
String toString() {
    return 'IssueMessagesModel(id: $id, subject: $subject, status: $status, orderId: $orderId, createdAt: $createdAt, messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$IssueMessagesModelCopyWith<$Res> implements $IssueMessagesModelCopyWith<$Res> {
  factory _$IssueMessagesModelCopyWith(_IssueMessagesModel value, $Res Function(_IssueMessagesModel) _then) = __$IssueMessagesModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String subject, int status, int orderId, DateTime createdAt, List<MessagesModel> messages
});




}
/// @nodoc
class __$IssueMessagesModelCopyWithImpl<$Res>
    implements _$IssueMessagesModelCopyWith<$Res> {
  __$IssueMessagesModelCopyWithImpl(this._self, this._then);

  final _IssueMessagesModel _self;
  final $Res Function(_IssueMessagesModel) _then;

/// Create a copy of IssueMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? subject = null,Object? status = null,Object? orderId = null,Object? createdAt = null,Object? messages = null,}) {
  return _then(_IssueMessagesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessagesModel>,
  ));
}


}


/// @nodoc
mixin _$MessagesModel {

 int get id; String get message; DateTime get createdAt; String get senderName; bool get isAdmin;
/// Create a copy of MessagesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesModelCopyWith<MessagesModel> get copyWith => _$MessagesModelCopyWithImpl<MessagesModel>(this as MessagesModel, _$identity);

  /// Serializes this MessagesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MessagesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.senderName, _this.senderName) || other.senderName == _this.senderName)&&(identical(other.isAdmin, _this.isAdmin) || other.isAdmin == _this.isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MessagesModel;
  return Object.hash(runtimeType,_this.id,_this.message,_this.createdAt,_this.senderName,_this.isAdmin);
}

@override
String toString() {
  final _this = this as MessagesModel;
  return 'MessagesModel(id: ${_this.id}, message: ${_this.message}, createdAt: ${_this.createdAt}, senderName: ${_this.senderName}, isAdmin: ${_this.isAdmin})';
}


}

/// @nodoc
abstract mixin class $MessagesModelCopyWith<$Res>  {
  factory $MessagesModelCopyWith(MessagesModel value, $Res Function(MessagesModel) _then) = _$MessagesModelCopyWithImpl;
@useResult
$Res call({
 int id, String message, DateTime createdAt, String senderName, bool isAdmin
});




}
/// @nodoc
class _$MessagesModelCopyWithImpl<$Res>
    implements $MessagesModelCopyWith<$Res> {
  _$MessagesModelCopyWithImpl(this._self, this._then);

  final MessagesModel _self;
  final $Res Function(MessagesModel) _then;

/// Create a copy of MessagesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = null,Object? createdAt = null,Object? senderName = null,Object? isAdmin = null,}) {
  return _then(MessagesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MessagesModel].
extension MessagesModelPatterns on MessagesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagesModel value)  $default,){
final _that = this;
switch (_that) {
case _MessagesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagesModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessagesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String message,  DateTime createdAt,  String senderName,  bool isAdmin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagesModel() when $default != null:
return $default(_that.id,_that.message,_that.createdAt,_that.senderName,_that.isAdmin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String message,  DateTime createdAt,  String senderName,  bool isAdmin)  $default,) {final _that = this;
switch (_that) {
case _MessagesModel():
return $default(_that.id,_that.message,_that.createdAt,_that.senderName,_that.isAdmin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String message,  DateTime createdAt,  String senderName,  bool isAdmin)?  $default,) {final _that = this;
switch (_that) {
case _MessagesModel() when $default != null:
return $default(_that.id,_that.message,_that.createdAt,_that.senderName,_that.isAdmin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagesModel implements MessagesModel {
  const _MessagesModel({required this.id, required this.message, required this.createdAt, required this.senderName, required this.isAdmin});
  factory _MessagesModel.fromJson(Map<String, dynamic> json) => _$MessagesModelFromJson(json);

@override final  int id;
@override final  String message;
@override final  DateTime createdAt;
@override final  String senderName;
@override final  bool isAdmin;

/// Create a copy of MessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagesModelCopyWith<_MessagesModel> get copyWith => __$MessagesModelCopyWithImpl<_MessagesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,message,createdAt,senderName,isAdmin);
}

@override
String toString() {
    return 'MessagesModel(id: $id, message: $message, createdAt: $createdAt, senderName: $senderName, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class _$MessagesModelCopyWith<$Res> implements $MessagesModelCopyWith<$Res> {
  factory _$MessagesModelCopyWith(_MessagesModel value, $Res Function(_MessagesModel) _then) = __$MessagesModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String message, DateTime createdAt, String senderName, bool isAdmin
});




}
/// @nodoc
class __$MessagesModelCopyWithImpl<$Res>
    implements _$MessagesModelCopyWith<$Res> {
  __$MessagesModelCopyWithImpl(this._self, this._then);

  final _MessagesModel _self;
  final $Res Function(_MessagesModel) _then;

/// Create a copy of MessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = null,Object? createdAt = null,Object? senderName = null,Object? isAdmin = null,}) {
  return _then(_MessagesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
