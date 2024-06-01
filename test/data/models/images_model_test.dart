import 'package:error_handler_project/data/models/curated_photos.dart';
import 'package:error_handler_project/domain/entities/curated_photos_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testImageDetail = CuratedPhotosModel(
      page: 1,
      perPage: 15,
      photos: [],
      nextPage:
          'https://api.pexels.com/v1/curated/?page=2&per_page=15&per_page=1');

  test('should be a subclass of Image entity', () async {
    //assert
    expect(testImageDetail, isA<CuratedPhotosEntity>());
  });

  // test('', () async {
  //   //arrange
  //   final Map<String, dynamic> jsonMap = json.decode(
  //     readJson('helpers/dummy_data/dummy_photos_response.json.json'),
  //   );
  //
  //   //act
  //   final result = CuratedPhotosModel.fromJson(jsonMap);
  //
  //   //assert
  //   expect(result, equals(testImageDetail));
  // });
}
