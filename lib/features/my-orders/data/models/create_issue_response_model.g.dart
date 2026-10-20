// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_issue_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateIssueResponseModel _$CreateIssueResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateIssueResponseModel(
  message: json['message'] as String,
  ticketId: (json['ticketId'] as num).toInt(),
);

Map<String, dynamic> _$CreateIssueResponseModelToJson(
  CreateIssueResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'ticketId': instance.ticketId,
};
