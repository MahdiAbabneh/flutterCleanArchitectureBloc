import 'package:error_handler_project/domain/entities/curated_photos_entity.dart';

abstract class ImagesRepository {
  Future<CuratedPhotosEntity> getAllImages();
}
