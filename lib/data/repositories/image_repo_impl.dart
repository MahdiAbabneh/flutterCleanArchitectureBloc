import 'package:error_handler_project/data/datasources/image_remote.dart';
import 'package:error_handler_project/domain/entities/curated_photos_entity.dart';
import 'package:error_handler_project/domain/repositories/repo_Image.dart';

class ImageRepoImpl implements ImagesRepository {
  final ImageRemoteDataSource imageRemoteDataSource;

  ImageRepoImpl({required this.imageRemoteDataSource});

  @override
  Future<CuratedPhotosEntity> getAllImages() async {
    final remoteImages = await imageRemoteDataSource.getAllImages();
    return remoteImages;
  }
}
