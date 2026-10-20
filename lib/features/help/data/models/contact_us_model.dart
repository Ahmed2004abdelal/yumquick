import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_model.g.dart';

@JsonSerializable()
class ContactUsModel {
  final int id;
  final String platform;
  final String urlOrNumber;

  ContactUsModel({
    required this.id,
    required this.platform,
    required this.urlOrNumber,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsModelToJson(this);
}
