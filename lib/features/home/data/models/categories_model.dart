import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  final int id;
  final String name;
  final String iconUrl;
  final List<SubCategoriesModel> subCategories;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.subCategories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}

@JsonSerializable()
class SubCategoriesModel {
  final int id;
  final String name;

  SubCategoriesModel({required this.id, required this.name});
  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoriesModelToJson(this);
}
