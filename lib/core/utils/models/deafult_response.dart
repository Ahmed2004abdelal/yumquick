import 'package:json_annotation/json_annotation.dart';

part 'deafult_response.g.dart';

@JsonSerializable()
class DefaultResponse {
  final String message;

  DefaultResponse({required this.message});

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}
