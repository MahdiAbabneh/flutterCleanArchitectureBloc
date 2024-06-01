import 'package:error_handler_project/data/models/src.dart';
import 'package:error_handler_project/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required super.id,
    required super.width,
    required super.height,
    required super.url,
    required super.photographer,
    required super.photographerUrl,
    required super.photographerId,
    required super.avgColor,
    required SrcModel super.src,
    required super.liked,
    required super.alt,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] ?? 0,
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      url: json['url'] ?? "",
      photographer: json['photographer'] ?? "",
      photographerUrl: json['photographer_url'] ?? "",
      photographerId: json['photographer_id'] ?? 0,
      avgColor: json['avg_color'] ?? "",
      src: SrcModel.fromJson(json['src']),
      liked: json['liked'] ?? false,
      alt: json['alt_description'] ?? "",
    );
  }

}
