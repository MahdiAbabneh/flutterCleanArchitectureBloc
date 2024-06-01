import 'package:error_handler_project/data/models/photo.dart';
import 'package:error_handler_project/domain/entities/curated_photos_entity.dart';

class CuratedPhotosModel extends CuratedPhotosEntity {
  const CuratedPhotosModel({
    required super.page,
    required super.perPage,
    required super.photos,
    required super.nextPage,
  });

  factory CuratedPhotosModel.fromJson(Map<String, dynamic> json) {
    return CuratedPhotosModel(
      page: json['page'] ?? 0,
      perPage: json['per_page'] ?? 0,
      photos:
          List.from(json['photos']).map((e) => PhotoModel.fromJson(e)).toList(),
      nextPage: json['next_page'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'photos': photos.map((photo) => photo.toJson()).toList(),
      'next_page': nextPage,
    };
  }
}
