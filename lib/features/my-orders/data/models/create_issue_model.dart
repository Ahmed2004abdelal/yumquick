import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_issue_model.g.dart';

@JsonSerializable()
class CreateIssueModel {
  final String subject;
  final String initialMessage;
  final int orderId;

  CreateIssueModel({
    required this.subject,
    required this.initialMessage,
    required this.orderId,
  });

  factory CreateIssueModel.fromJson(Map<String, dynamic> json) =>
      _$CreateIssueModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreateIssueModelToJson(this);
}
