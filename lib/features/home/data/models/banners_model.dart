import 'package:json_annotation/json_annotation.dart';

part 'banners_model.g.dart';

@JsonSerializable()
class BannersModel {
  final int? id;
  final String? imageUrl;
  final String? title;

  BannersModel({this.id, this.imageUrl, this.title});

  factory BannersModel.fromJson(Map<String, dynamic> json) =>
      _$BannersModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannersModelToJson(this);
}
