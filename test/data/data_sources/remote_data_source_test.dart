import 'package:dio/dio.dart';
import 'package:error_handler_project/core/network/dio_network.dart';
import 'package:error_handler_project/data/datasources/image_remote.dart';
import 'package:error_handler_project/data/models/curated_photos.dart';
import 'package:error_handler_project/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;


void main() {

  late MockHttpClient mockHttpClient;
  late ImageRemoteDataSourceImpl imageRemoteDataSourceImpl;

  setUp(() {
    sl.registerLazySingleton<Dio>(() => Dio(NetworkDio.getBaseOptions()));
    sl.registerLazySingleton<NetworkDio>(() => NetworkDio(sl<Dio>()));
    mockHttpClient = MockHttpClient();
    imageRemoteDataSourceImpl = ImageRemoteDataSourceImpl();
  });


  group('get current images', () {

    test('should return images model when the response code is 200', () async {

      //arrange
      when(
        mockHttpClient.get(
          Uri.parse("https://api.pexels.com/v1/curated/?per_page=40")
        )
      ).thenAnswer(
        (_) async => http.Response(
          readJson('helpers/dummy_data/dummy_photos_response.json.json'),
          200
        )
      );

      //act
      final result = await imageRemoteDataSourceImpl.getAllImages();

      //assert
      expect(result, isA<CuratedPhotosModel>());

    });
  });
}