// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_issues_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportIssuesModel _$SupportIssuesModelFromJson(Map<String, dynamic> json) =>
    SupportIssuesModel(
      id: (json['id'] as num).toInt(),
      subject: json['subject'] as String,
      status: (json['status'] as num).toInt(),
      orderId: (json['orderId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      messageCount: (json['messageCount'] as num).toInt(),
    );

Map<String, dynamic> _$SupportIssuesModelToJson(SupportIssuesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'status': instance.status,
      'orderId': instance.orderId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'messageCount': instance.messageCount,
    };
