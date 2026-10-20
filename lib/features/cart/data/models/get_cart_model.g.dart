// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartModel _$GetCartModelFromJson(Map<String, dynamic> json) => GetCartModel(
  totalCartPrice: (json['totalCartPrice'] as num?)?.toDouble(),
  products: (json['items'] as List<dynamic>)
      .map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetCartModelToJson(GetCartModel instance) =>
    <String, dynamic>{
      'totalCartPrice': instance.totalCartPrice,
      'items': instance.products,
    };

CartProduct _$CartProductFromJson(Map<String, dynamic> json) => CartProduct(
  id: (json['id'] as num).toInt(),
  productId: (json['productId'] as num).toInt(),
  productName: json['productName'] as String,
  productImage: json['productImage'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toDouble(),
  totalItemPrice: (json['totalItemPrice'] as num).toDouble(),
  selectedVariants: (json['selectedVariants'] as List<dynamic>)
      .map((e) => ToppingsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalItemPrice': instance.totalItemPrice,
      'selectedVariants': instance.selectedVariants,
    };
