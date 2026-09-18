import 'package:json_annotation/json_annotation.dart';

part 'google_login_request_model.g.dart';

@JsonSerializable()
class GoogleLoginRequestModel {
  final String providerToken;

  GoogleLoginRequestModel({required this.providerToken});

  Map<String, dynamic> toJson() => _$GoogleLoginRequestModelToJson(this);
}
