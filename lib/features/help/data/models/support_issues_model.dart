import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_issues_model.g.dart';

@JsonSerializable()
class SupportIssuesModel {
  final int id;
  final String subject;
  final int status;
  final int orderId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int messageCount;

  SupportIssuesModel({
    required this.id,
    required this.subject,
    required this.status,
    required this.orderId,
    required this.createdAt,
    required this.updatedAt,
    required this.messageCount,
  });

  factory SupportIssuesModel.fromJson(Map<String, dynamic> json) =>
      _$SupportIssuesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupportIssuesModelToJson(this);
}
