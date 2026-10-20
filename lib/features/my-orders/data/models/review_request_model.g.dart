// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewRequestModel _$ReviewRequestModelFromJson(Map<String, dynamic> json) =>
    ReviewRequestModel(
      orderId: (json['orderId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ReviewRequestModelToJson(ReviewRequestModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'productId': instance.productId,
      'rating': instance.rating,
      'comment': instance.comment,
    };
