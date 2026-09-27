import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_favorite_model.g.dart';

@JsonSerializable()
class ToggleFavoriteModel {
  final String? message;
  final bool? isFavorite;

  ToggleFavoriteModel({this.message, this.isFavorite});

  factory ToggleFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$ToggleFavoriteModelFromJson(json);
  Map<String, dynamic> toJson() => _$ToggleFavoriteModelToJson(this);
}

@JsonSerializable()
class IsFavoriteRequest {
  final int productId;

  IsFavoriteRequest({required this.productId});

  factory IsFavoriteRequest.fromJson(Map<String, dynamic> json) =>
      _$IsFavoriteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$IsFavoriteRequestToJson(this);
}
