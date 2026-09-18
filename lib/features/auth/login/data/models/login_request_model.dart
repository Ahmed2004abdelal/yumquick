import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  final String identifier;
  final String password;

  LoginRequestModel({required this.identifier, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
