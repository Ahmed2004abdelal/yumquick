// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteOrderModel _$CompleteOrderModelFromJson(Map<String, dynamic> json) =>
    CompleteOrderModel(
      id: (json['id'] as num).toInt(),
      orderStatus: (json['status'] as num).toInt(),
      subTotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      taxFee: (json['taxFee'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      address: json['address'] == null
          ? null
          : OrderAddressModel.fromJson(json['address'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompleteOrderModelToJson(CompleteOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.orderStatus,
      'subtotal': instance.subTotal,
      'deliveryFee': instance.deliveryFee,
      'taxFee': instance.taxFee,
      'discountAmount': instance.discountAmount,
      'totalAmount': instance.totalAmount,
      'createdAt': instance.createdAt.toIso8601String(),
      'address': instance.address,
      'items': instance.items,
    };

OrderAddressModel _$OrderAddressModelFromJson(Map<String, dynamic> json) =>
    OrderAddressModel(
      label: json['label'] as String,
      fullAddress: json['fullAddress'] as String,
    );

Map<String, dynamic> _$OrderAddressModelToJson(OrderAddressModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'fullAddress': instance.fullAddress,
    };

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) => ItemsModel(
  productId: (json['productId'] as num).toInt(),
  productName: json['productName'] as String,
  productImage: json['productImage'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPriceSnapshot: (json['unitPriceSnapshot'] as num).toDouble(),
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => Variants.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'quantity': instance.quantity,
      'unitPriceSnapshot': instance.unitPriceSnapshot,
      'variants': instance.variants,
    };

Variants _$VariantsFromJson(Map<String, dynamic> json) => Variants(
  name: json['name'] as String,
  extraPriceSnapshot: (json['extraPriceSnapshot'] as num).toDouble(),
);

Map<String, dynamic> _$VariantsToJson(Variants instance) => <String, dynamic>{
  'name': instance.name,
  'extraPriceSnapshot': instance.extraPriceSnapshot,
};
