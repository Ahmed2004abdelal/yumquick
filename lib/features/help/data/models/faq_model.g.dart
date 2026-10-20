// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => FaqModel(
  id: (json['id'] as num).toInt(),
  category: json['category'] as String,
  question: json['question'] as String,
  answer: json['answer'] as String,
);

Map<String, dynamic> _$FaqModelToJson(FaqModel instance) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'question': instance.question,
  'answer': instance.answer,
};
