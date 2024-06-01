import 'package:dio/dio.dart';
import 'package:error_handler_project/domain/repositories/repo_todo.dart';
import 'package:error_handler_project/domain/usecases/get_all_todo.dart';
import 'package:error_handler_project/presentation/bloc/cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/check_connection.dart';
import 'core/network/dio_network.dart';
import 'core/network/error/error_logger.dart';
import 'data/datasources/image_remote.dart';
import 'data/datasources/todo_remote.dart';
import 'data/repositories/image_repo_impl.dart';
import 'data/repositories/todo_repo_impl.dart';
import 'domain/repositories/repo_Image.dart';
import 'domain/usecases/delete_todo.dart';
import 'domain/usecases/get_all_images.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerSingleton(ErrorLogger());

  sl.registerFactory(() => HomeCubit(sl(), sl(),sl()));

  sl.registerLazySingleton(() => GetAllImagesUseCase(sl()));

  sl.registerLazySingleton(() => GetAllTodoUseCase(sl()));

  sl.registerLazySingleton(() => DeleteTodoUseCase(sl()));


  sl.registerLazySingleton<ImagesRepository>(
      () => ImageRepoImpl(imageRemoteDataSource: sl()));

  sl.registerLazySingleton<TodoRepositories>(
      () => TodoRepoImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<ImageRemoteDataSource>(
      () => ImageRemoteDataSourceImpl());

  sl.registerLazySingleton<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton<Dio>(() => Dio(NetworkDio.getBaseOptions()));
  sl.registerLazySingleton<NetworkDio>(() => NetworkDio(sl<Dio>()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
