import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_request.g.dart';

@JsonSerializable()
class DefaultRequest {
  final String? cancelReasonId;

  DefaultRequest({this.cancelReasonId});

  factory DefaultRequest.fromJson(Map<String, dynamic> json) =>
      _$DefaultRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultRequestToJson(this);
}
