import 'package:dio/dio.dart';
import 'package:error_handler_project/core/network/check_connection.dart';
import 'package:error_handler_project/core/network/error/exceptions.dart';
import 'package:error_handler_project/core/utils/constant.dart';
import 'package:error_handler_project/core/utils/endpoints.dart';
import 'package:error_handler_project/injection.dart';
import 'error/dio_error_handler.dart';

class NetworkDio {
  final Dio client;

  NetworkDio(this.client);

  static BaseOptions getBaseOptions() {
    final options = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {"Content-type": "application/json; charset=utf-8"});

    return options;
  }

  Future<T> getDataModelMap<T>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await sl<NetworkDio>().client.get<Map<String, dynamic>>(
          endpoint,
          queryParameters: queryParams,
          options: Options(headers: EndPoints.authorizationImages()),
        );
    return fromJson(response.data!);
  }

  Future<List<T>> getDataModelList<T>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      if (await sl<NetworkInfo>().isConnected) {
        final response = await sl<NetworkDio>().client.get<List<dynamic>>(
              endpoint,
              queryParameters: queryParams,
              options: Options(headers: EndPoints.authorizationImages()),
            );
        List<T> dataList =
            response.data!.map<T>((item) => fromJson(item)).toList();
        return dataList;
      } else {
        throw ServerException(OFFLINE_FAILURE_MESSAGE, null);
      }
    } catch (e) {
      if (e is DioException) {
        handleDioError(e);
      } else {
        throw ServerException(e.toString(), null);
      }
      rethrow;
    }
  }

  Future<bool> deleteDataModel({
    required String endpoint,
  }) async {
    try {
      if (await sl<NetworkInfo>().isConnected) {
        await sl<NetworkDio>().client.delete(
              endpoint,
              options: Options(headers: EndPoints.authorizationImages()),
            );
        return true;
      } else {
        throw ServerException(OFFLINE_FAILURE_MESSAGE, null);
      }
    } catch (e) {
      if (e is DioException) {
        handleDioError(e);
      } else {
        throw ServerException(e.toString(), null);
      }
      return false;
    }
  }

  void addAuthHeaders(String token) {
    client.options.headers["authorization"] = "Bearer $token";
  }

  void removeAuthHeaders() {
    client.options.headers.remove("authorization");
  }
}
