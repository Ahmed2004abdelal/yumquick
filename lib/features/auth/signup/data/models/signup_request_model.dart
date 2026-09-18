import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  @JsonKey(name: 'FullName')
  final String fullName;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'PhoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'Password')
  final String password;
  final String role;

  SignupRequestModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.role = 'Customer',
  });

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}
