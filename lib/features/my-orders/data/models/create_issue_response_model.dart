import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_issue_response_model.g.dart';

@JsonSerializable()
class CreateIssueResponseModel {
  final String message;
  final int ticketId;

  CreateIssueResponseModel({required this.message, required this.ticketId});

  factory CreateIssueResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateIssueResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateIssueResponseModelToJson(this);
}
