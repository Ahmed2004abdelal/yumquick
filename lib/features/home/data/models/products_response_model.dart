import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  final List<ProductsModel> data;

  ProductsResponseModel({required this.data});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}
