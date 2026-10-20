// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HelpState {

 HelpStatus get supportIssuesStatus; HelpStatus get issueMessagesStatus; HelpStatus get faqStatus; HelpStatus get contactUsStatus; int get selectedTabIndex; HelpStatus get replyStatus; List<SupportIssuesModel> get supportIssues; List<IssueMessagesModel> get issueMessagesList; List<FaqModel> get faqSuccessList; List<ContactUsModel> get contactUsSuccessList; IssueMessagesModel? get issueMessages; String get errorMessage;
/// Create a copy of HelpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpStateCopyWith<HelpState> get copyWith => _$HelpStateCopyWithImpl<HelpState>(this as HelpState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HelpState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpState&&(identical(other.supportIssuesStatus, _this.supportIssuesStatus) || other.supportIssuesStatus == _this.supportIssuesStatus)&&(identical(other.issueMessagesStatus, _this.issueMessagesStatus) || other.issueMessagesStatus == _this.issueMessagesStatus)&&(identical(other.faqStatus, _this.faqStatus) || other.faqStatus == _this.faqStatus)&&(identical(other.contactUsStatus, _this.contactUsStatus) || other.contactUsStatus == _this.contactUsStatus)&&(identical(other.selectedTabIndex, _this.selectedTabIndex) || other.selectedTabIndex == _this.selectedTabIndex)&&(identical(other.replyStatus, _this.replyStatus) || other.replyStatus == _this.replyStatus)&&const DeepCollectionEquality().equals(other.supportIssues, _this.supportIssues)&&const DeepCollectionEquality().equals(other.issueMessagesList, _this.issueMessagesList)&&const DeepCollectionEquality().equals(other.faqSuccessList, _this.faqSuccessList)&&const DeepCollectionEquality().equals(other.contactUsSuccessList, _this.contactUsSuccessList)&&(identical(other.issueMessages, _this.issueMessages) || other.issueMessages == _this.issueMessages)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as HelpState;
  return Object.hash(runtimeType,_this.supportIssuesStatus,_this.issueMessagesStatus,_this.faqStatus,_this.contactUsStatus,_this.selectedTabIndex,_this.replyStatus,const DeepCollectionEquality().hash(_this.supportIssues),const DeepCollectionEquality().hash(_this.issueMessagesList),const DeepCollectionEquality().hash(_this.faqSuccessList),const DeepCollectionEquality().hash(_this.contactUsSuccessList),_this.issueMessages,_this.errorMessage);
}

@override
String toString() {
  final _this = this as HelpState;
  return 'HelpState(supportIssuesStatus: ${_this.supportIssuesStatus}, issueMessagesStatus: ${_this.issueMessagesStatus}, faqStatus: ${_this.faqStatus}, contactUsStatus: ${_this.contactUsStatus}, selectedTabIndex: ${_this.selectedTabIndex}, replyStatus: ${_this.replyStatus}, supportIssues: ${_this.supportIssues}, issueMessagesList: ${_this.issueMessagesList}, faqSuccessList: ${_this.faqSuccessList}, contactUsSuccessList: ${_this.contactUsSuccessList}, issueMessages: ${_this.issueMessages}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $HelpStateCopyWith<$Res>  {
  factory $HelpStateCopyWith(HelpState value, $Res Function(HelpState) _then) = _$HelpStateCopyWithImpl;
@useResult
$Res call({
 HelpStatus supportIssuesStatus, HelpStatus issueMessagesStatus, HelpStatus faqStatus, HelpStatus contactUsStatus, int selectedTabIndex, HelpStatus replyStatus, List<SupportIssuesModel> supportIssues, List<IssueMessagesModel> issueMessagesList, List<FaqModel> faqSuccessList, List<ContactUsModel> contactUsSuccessList, IssueMessagesModel? issueMessages, String errorMessage
});


$IssueMessagesModelCopyWith<$Res>? get issueMessages;

}
/// @nodoc
class _$HelpStateCopyWithImpl<$Res>
    implements $HelpStateCopyWith<$Res> {
  _$HelpStateCopyWithImpl(this._self, this._then);

  final HelpState _self;
  final $Res Function(HelpState) _then;

/// Create a copy of HelpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? supportIssuesStatus = null,Object? issueMessagesStatus = null,Object? faqStatus = null,Object? contactUsStatus = null,Object? selectedTabIndex = null,Object? replyStatus = null,Object? supportIssues = null,Object? issueMessagesList = null,Object? faqSuccessList = null,Object? contactUsSuccessList = null,Object? issueMessages = freezed,Object? errorMessage = null,}) {
  return _then(HelpState(
supportIssuesStatus: null == supportIssuesStatus ? _self.supportIssuesStatus : supportIssuesStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,issueMessagesStatus: null == issueMessagesStatus ? _self.issueMessagesStatus : issueMessagesStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,faqStatus: null == faqStatus ? _self.faqStatus : faqStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,contactUsStatus: null == contactUsStatus ? _self.contactUsStatus : contactUsStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,replyStatus: null == replyStatus ? _self.replyStatus : replyStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,supportIssues: null == supportIssues ? _self.supportIssues : supportIssues // ignore: cast_nullable_to_non_nullable
as List<SupportIssuesModel>,issueMessagesList: null == issueMessagesList ? _self.issueMessagesList : issueMessagesList // ignore: cast_nullable_to_non_nullable
as List<IssueMessagesModel>,faqSuccessList: null == faqSuccessList ? _self.faqSuccessList : faqSuccessList // ignore: cast_nullable_to_non_nullable
as List<FaqModel>,contactUsSuccessList: null == contactUsSuccessList ? _self.contactUsSuccessList : contactUsSuccessList // ignore: cast_nullable_to_non_nullable
as List<ContactUsModel>,issueMessages: freezed == issueMessages ? _self.issueMessages : issueMessages // ignore: cast_nullable_to_non_nullable
as IssueMessagesModel?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of HelpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueMessagesModelCopyWith<$Res>? get issueMessages {
    if (_self.issueMessages == null) {
    return null;
  }

  return $IssueMessagesModelCopyWith<$Res>(_self.issueMessages!, (value) {
    return _then(_self.copyWith(issueMessages: value));
  });
}
}


/// Adds pattern-matching-related methods to [HelpState].
extension HelpStatePatterns on HelpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpState value)  $default,){
final _that = this;
switch (_that) {
case _HelpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpState value)?  $default,){
final _that = this;
switch (_that) {
case _HelpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HelpStatus supportIssuesStatus,  HelpStatus issueMessagesStatus,  HelpStatus faqStatus,  HelpStatus contactUsStatus,  int selectedTabIndex,  HelpStatus replyStatus,  List<SupportIssuesModel> supportIssues,  List<IssueMessagesModel> issueMessagesList,  List<FaqModel> faqSuccessList,  List<ContactUsModel> contactUsSuccessList,  IssueMessagesModel? issueMessages,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpState() when $default != null:
return $default(_that.supportIssuesStatus,_that.issueMessagesStatus,_that.faqStatus,_that.contactUsStatus,_that.selectedTabIndex,_that.replyStatus,_that.supportIssues,_that.issueMessagesList,_that.faqSuccessList,_that.contactUsSuccessList,_that.issueMessages,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HelpStatus supportIssuesStatus,  HelpStatus issueMessagesStatus,  HelpStatus faqStatus,  HelpStatus contactUsStatus,  int selectedTabIndex,  HelpStatus replyStatus,  List<SupportIssuesModel> supportIssues,  List<IssueMessagesModel> issueMessagesList,  List<FaqModel> faqSuccessList,  List<ContactUsModel> contactUsSuccessList,  IssueMessagesModel? issueMessages,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HelpState():
return $default(_that.supportIssuesStatus,_that.issueMessagesStatus,_that.faqStatus,_that.contactUsStatus,_that.selectedTabIndex,_that.replyStatus,_that.supportIssues,_that.issueMessagesList,_that.faqSuccessList,_that.contactUsSuccessList,_that.issueMessages,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HelpStatus supportIssuesStatus,  HelpStatus issueMessagesStatus,  HelpStatus faqStatus,  HelpStatus contactUsStatus,  int selectedTabIndex,  HelpStatus replyStatus,  List<SupportIssuesModel> supportIssues,  List<IssueMessagesModel> issueMessagesList,  List<FaqModel> faqSuccessList,  List<ContactUsModel> contactUsSuccessList,  IssueMessagesModel? issueMessages,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HelpState() when $default != null:
return $default(_that.supportIssuesStatus,_that.issueMessagesStatus,_that.faqStatus,_that.contactUsStatus,_that.selectedTabIndex,_that.replyStatus,_that.supportIssues,_that.issueMessagesList,_that.faqSuccessList,_that.contactUsSuccessList,_that.issueMessages,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HelpState implements HelpState {
  const _HelpState({this.supportIssuesStatus = HelpStatus.initial, this.issueMessagesStatus = HelpStatus.initial, this.faqStatus = HelpStatus.initial, this.contactUsStatus = HelpStatus.initial, this.selectedTabIndex = 0, this.replyStatus = HelpStatus.initial,  List<SupportIssuesModel> supportIssues = const [],  List<IssueMessagesModel> issueMessagesList = const [],  List<FaqModel> faqSuccessList = const [],  List<ContactUsModel> contactUsSuccessList = const [], this.issueMessages, this.errorMessage = ''}): _supportIssues = supportIssues,_issueMessagesList = issueMessagesList,_faqSuccessList = faqSuccessList,_contactUsSuccessList = contactUsSuccessList;
  

@override@JsonKey() final  HelpStatus supportIssuesStatus;
@override@JsonKey() final  HelpStatus issueMessagesStatus;
@override@JsonKey() final  HelpStatus faqStatus;
@override@JsonKey() final  HelpStatus contactUsStatus;
@override@JsonKey() final  int selectedTabIndex;
@override@JsonKey() final  HelpStatus replyStatus;
 final  List<SupportIssuesModel> _supportIssues;
@override@JsonKey() List<SupportIssuesModel> get supportIssues {
  if (_supportIssues is EqualUnmodifiableListView) return _supportIssues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supportIssues);
}

 final  List<IssueMessagesModel> _issueMessagesList;
@override@JsonKey() List<IssueMessagesModel> get issueMessagesList {
  if (_issueMessagesList is EqualUnmodifiableListView) return _issueMessagesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_issueMessagesList);
}

 final  List<FaqModel> _faqSuccessList;
@override@JsonKey() List<FaqModel> get faqSuccessList {
  if (_faqSuccessList is EqualUnmodifiableListView) return _faqSuccessList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faqSuccessList);
}

 final  List<ContactUsModel> _contactUsSuccessList;
@override@JsonKey() List<ContactUsModel> get contactUsSuccessList {
  if (_contactUsSuccessList is EqualUnmodifiableListView) return _contactUsSuccessList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contactUsSuccessList);
}

@override final  IssueMessagesModel? issueMessages;
@override@JsonKey() final  String errorMessage;

/// Create a copy of HelpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpStateCopyWith<_HelpState> get copyWith => __$HelpStateCopyWithImpl<_HelpState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpState&&(identical(other.supportIssuesStatus, supportIssuesStatus) || other.supportIssuesStatus == supportIssuesStatus)&&(identical(other.issueMessagesStatus, issueMessagesStatus) || other.issueMessagesStatus == issueMessagesStatus)&&(identical(other.faqStatus, faqStatus) || other.faqStatus == faqStatus)&&(identical(other.contactUsStatus, contactUsStatus) || other.contactUsStatus == contactUsStatus)&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.replyStatus, replyStatus) || other.replyStatus == replyStatus)&&const DeepCollectionEquality().equals(other.supportIssues, _supportIssues)&&const DeepCollectionEquality().equals(other.issueMessagesList, _issueMessagesList)&&const DeepCollectionEquality().equals(other.faqSuccessList, _faqSuccessList)&&const DeepCollectionEquality().equals(other.contactUsSuccessList, _contactUsSuccessList)&&(identical(other.issueMessages, issueMessages) || other.issueMessages == issueMessages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,supportIssuesStatus,issueMessagesStatus,faqStatus,contactUsStatus,selectedTabIndex,replyStatus,const DeepCollectionEquality().hash(_supportIssues),const DeepCollectionEquality().hash(_issueMessagesList),const DeepCollectionEquality().hash(_faqSuccessList),const DeepCollectionEquality().hash(_contactUsSuccessList),issueMessages,errorMessage);
}

@override
String toString() {
    return 'HelpState(supportIssuesStatus: $supportIssuesStatus, issueMessagesStatus: $issueMessagesStatus, faqStatus: $faqStatus, contactUsStatus: $contactUsStatus, selectedTabIndex: $selectedTabIndex, replyStatus: $replyStatus, supportIssues: $supportIssues, issueMessagesList: $issueMessagesList, faqSuccessList: $faqSuccessList, contactUsSuccessList: $contactUsSuccessList, issueMessages: $issueMessages, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HelpStateCopyWith<$Res> implements $HelpStateCopyWith<$Res> {
  factory _$HelpStateCopyWith(_HelpState value, $Res Function(_HelpState) _then) = __$HelpStateCopyWithImpl;
@override @useResult
$Res call({
 HelpStatus supportIssuesStatus, HelpStatus issueMessagesStatus, HelpStatus faqStatus, HelpStatus contactUsStatus, int selectedTabIndex, HelpStatus replyStatus, List<SupportIssuesModel> supportIssues, List<IssueMessagesModel> issueMessagesList, List<FaqModel> faqSuccessList, List<ContactUsModel> contactUsSuccessList, IssueMessagesModel? issueMessages, String errorMessage
});


@override $IssueMessagesModelCopyWith<$Res>? get issueMessages;

}
/// @nodoc
class __$HelpStateCopyWithImpl<$Res>
    implements _$HelpStateCopyWith<$Res> {
  __$HelpStateCopyWithImpl(this._self, this._then);

  final _HelpState _self;
  final $Res Function(_HelpState) _then;

/// Create a copy of HelpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? supportIssuesStatus = null,Object? issueMessagesStatus = null,Object? faqStatus = null,Object? contactUsStatus = null,Object? selectedTabIndex = null,Object? replyStatus = null,Object? supportIssues = null,Object? issueMessagesList = null,Object? faqSuccessList = null,Object? contactUsSuccessList = null,Object? issueMessages = freezed,Object? errorMessage = null,}) {
  return _then(_HelpState(
supportIssuesStatus: null == supportIssuesStatus ? _self.supportIssuesStatus : supportIssuesStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,issueMessagesStatus: null == issueMessagesStatus ? _self.issueMessagesStatus : issueMessagesStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,faqStatus: null == faqStatus ? _self.faqStatus : faqStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,contactUsStatus: null == contactUsStatus ? _self.contactUsStatus : contactUsStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,replyStatus: null == replyStatus ? _self.replyStatus : replyStatus // ignore: cast_nullable_to_non_nullable
as HelpStatus,supportIssues: null == supportIssues ? _self._supportIssues : supportIssues // ignore: cast_nullable_to_non_nullable
as List<SupportIssuesModel>,issueMessagesList: null == issueMessagesList ? _self._issueMessagesList : issueMessagesList // ignore: cast_nullable_to_non_nullable
as List<IssueMessagesModel>,faqSuccessList: null == faqSuccessList ? _self._faqSuccessList : faqSuccessList // ignore: cast_nullable_to_non_nullable
as List<FaqModel>,contactUsSuccessList: null == contactUsSuccessList ? _self._contactUsSuccessList : contactUsSuccessList // ignore: cast_nullable_to_non_nullable
as List<ContactUsModel>,issueMessages: freezed == issueMessages ? _self.issueMessages : issueMessages // ignore: cast_nullable_to_non_nullable
as IssueMessagesModel?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of HelpState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssueMessagesModelCopyWith<$Res>? get issueMessages {
    if (_self.issueMessages == null) {
    return null;
  }

  return $IssueMessagesModelCopyWith<$Res>(_self.issueMessages!, (value) {
    return _then(_self.copyWith(issueMessages: value));
  });
}
}

// dart format on
