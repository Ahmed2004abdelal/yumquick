// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateIssueModel _$CreateIssueModelFromJson(Map<String, dynamic> json) =>
    CreateIssueModel(
      subject: json['subject'] as String,
      initialMessage: json['initialMessage'] as String,
      orderId: (json['orderId'] as num).toInt(),
    );

Map<String, dynamic> _$CreateIssueModelToJson(CreateIssueModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'initialMessage': instance.initialMessage,
      'orderId': instance.orderId,
    };
