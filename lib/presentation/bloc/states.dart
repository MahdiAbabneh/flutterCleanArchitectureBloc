import 'package:error_handler_project/domain/entities/curated_photos_entity.dart';
import 'package:error_handler_project/domain/entities/todo_entity.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class WallpaperSelectState extends HomeStates {}

class WallpaperGetDataSuccess extends HomeStates {
  final CuratedPhotosEntity image;

  WallpaperGetDataSuccess({required this.image});
}

class TodoGetDataSuccess extends HomeStates {
  final List<Todo> todo;

  TodoGetDataSuccess({required this.todo});
}

class WallpaperGetDataLoading extends HomeStates {}

class TodoGetDataLoading extends HomeStates {}

class WallpaperGetDataError extends HomeStates {
  final String message;

  WallpaperGetDataError({required this.message});
}

class TodoGetDataError extends HomeStates {
  final String message;

  TodoGetDataError({required this.message});
}

class TodoDeleteLoading extends HomeStates {}

class  TodoDeleteSuccess extends HomeStates {
  final bool todo;

  TodoDeleteSuccess({required this.todo});
}
