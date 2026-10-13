import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue_messages_model.freezed.dart';
part 'issue_messages_model.g.dart';

@freezed
abstract class IssueMessagesModel with _$IssueMessagesModel {
  const factory IssueMessagesModel({
    required int id,
    required String subject,
    required int status,
    required int orderId,
    required DateTime createdAt,
    required List<MessagesModel> messages,
  }) = _IssueMessagesModel;

  factory IssueMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$IssueMessagesModelFromJson(json);
}

@freezed
abstract class MessagesModel with _$MessagesModel {
  const factory MessagesModel({
    required int id,
    required String message,
    required DateTime createdAt,
    required String senderName,
    required bool isAdmin,
  }) = _MessagesModel;

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);
}
