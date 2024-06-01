import 'package:error_handler_project/domain/entities/curated_photos_entity.dart';
import 'package:error_handler_project/domain/repositories/repo_Image.dart';

class GetAllImagesUseCase {
  final ImagesRepository repository;

  GetAllImagesUseCase(this.repository);

  Future<CuratedPhotosEntity> call() async {
    return await repository.getAllImages();
  }
}
