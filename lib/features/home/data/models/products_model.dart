import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/home/data/models/toppings_model.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  final int id;
  final String name;
  final String? description;
  final String imageUrl;
  final double originalPrice;
  final double discountPercent;
  final double finalPrice;
  final double ratingAvg;
  final bool isNew;
  @JsonKey(name: 'variants')
  final List<ToppingsModel> toppings;
  @JsonKey(name: 'categoryName')
  final String? categoryName;

  ProductsModel({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountPercent,
    required this.finalPrice,
    required this.ratingAvg,
    required this.isNew,
    required this.toppings,
    this.categoryName,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
