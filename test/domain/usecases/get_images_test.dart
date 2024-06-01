import 'package:error_handler_project/domain/entities/curated_photos_entity.dart';
import 'package:error_handler_project/domain/usecases/get_all_images.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAllImagesUseCase getAllImagesUseCase;
  late MockImagesRepository mockImagesRepository;

  setUp(() {
    mockImagesRepository = MockImagesRepository();
    getAllImagesUseCase = GetAllImagesUseCase(mockImagesRepository);
  });

  const testImageDetail = CuratedPhotosEntity(
      page: 1,
      perPage: 15,
      photos: [],
      nextPage:
          'https://api.pexels.com/v1/curated/?page=2&per_page=15&per_pagsssssde=1');

  test('should get images detail from the repository', () async {
    // arrange
    when(mockImagesRepository.getAllImages())
        .thenAnswer((_) async => testImageDetail);

    // act
    final result =await getAllImagesUseCase.call();

    // assert
    expect(result, testImageDetail);
  });
}
