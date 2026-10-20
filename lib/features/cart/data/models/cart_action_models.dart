import 'package:json_annotation/json_annotation.dart';

part 'cart_action_models.g.dart';

@JsonSerializable()
class RemoveCartResponse {
  final String? message;

  RemoveCartResponse({this.message});

  factory RemoveCartResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveCartResponseToJson(this);
}

@JsonSerializable()
class ClearCartResponse {
  final String? message;

  ClearCartResponse({this.message});

  factory ClearCartResponse.fromJson(Map<String, dynamic> json) =>
      _$ClearCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClearCartResponseToJson(this);
}
