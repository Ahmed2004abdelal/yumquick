import 'package:json_annotation/json_annotation.dart';
import 'package:yumquick/features/home/data/models/toppings_model.dart';

part 'get_cart_model.g.dart';

@JsonSerializable()
class GetCartModel {
  final double? totalCartPrice;
  @JsonKey(name: 'items')
  final List<CartProduct> products;

  GetCartModel({this.totalCartPrice, required this.products});

  factory GetCartModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartModelToJson(this);
}

@JsonSerializable()
class CartProduct {
  final int id;
  final int productId;
  final String productName;
  final String productImage;
  final int quantity;
  final double unitPrice;
  final double totalItemPrice;
  final List<ToppingsModel> selectedVariants;

  CartProduct({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.quantity,
    required this.unitPrice,
    required this.totalItemPrice,
    required this.selectedVariants,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}
