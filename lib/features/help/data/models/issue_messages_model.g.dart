// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IssueMessagesModel _$IssueMessagesModelFromJson(Map<String, dynamic> json) =>
    _IssueMessagesModel(
      id: (json['id'] as num).toInt(),
      subject: json['subject'] as String,
      status: (json['status'] as num).toInt(),
      orderId: (json['orderId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IssueMessagesModelToJson(_IssueMessagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'status': instance.status,
      'orderId': instance.orderId,
      'createdAt': instance.createdAt.toIso8601String(),
      'messages': instance.messages,
    };

_MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    _MessagesModel(
      id: (json['id'] as num).toInt(),
      message: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      senderName: json['senderName'] as String,
      isAdmin: json['isAdmin'] as bool,
    );

Map<String, dynamic> _$MessagesModelToJson(_MessagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'createdAt': instance.createdAt.toIso8601String(),
      'senderName': instance.senderName,
      'isAdmin': instance.isAdmin,
    };
