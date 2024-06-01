import 'package:error_handler_project/domain/entities/src_entity.dart';

class SrcModel extends SrcEntity {
  const SrcModel({
    required super.original,
    required super.large2x,
    required super.large,
    required super.medium,
    required super.small,
    required super.portrait,
    required super.landscape,
    required super.tiny,
  });

  factory SrcModel.fromJson(Map<String, dynamic> json) {
    return SrcModel(
      original: json['original'] ?? "",
      large2x: json['large2x'] ?? "",
      large: json['large'] ?? "",
      medium: json['medium'] ?? "",
      small: json['small'] ?? "",
      portrait: json['portrait'] ?? "",
      landscape: json['landscape'] ?? "",
      tiny: json['tiny'] ?? "",
    );
  }
}
