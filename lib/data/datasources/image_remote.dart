import 'package:error_handler_project/core/utils/endpoints.dart';
import 'package:error_handler_project/core/network/dio_network.dart';
import 'package:error_handler_project/data/models/curated_photos.dart';
import 'package:error_handler_project/injection.dart';

abstract class ImageRemoteDataSource {
  Future<CuratedPhotosModel> getAllImages();
}

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  @override
  Future<CuratedPhotosModel> getAllImages() async {
    final response = await sl<NetworkDio>().getDataModelMap<CuratedPhotosModel>(
      endpoint: EndPoints.getImages(),
      fromJson: (data) => CuratedPhotosModel.fromJson(data),
    );
    return response;
  }
}
