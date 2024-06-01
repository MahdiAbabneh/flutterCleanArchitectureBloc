import 'package:error_handler_project/core/utils/constant.dart';
import 'package:error_handler_project/domain/usecases/delete_todo.dart';
import 'package:error_handler_project/domain/usecases/get_all_images.dart';
import 'package:error_handler_project/domain/usecases/get_all_todo.dart';
import 'package:error_handler_project/presentation/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllImagesUseCase getAllImages;
  final GetAllTodoUseCase getAllTodos;
  final DeleteTodoUseCase deleteTodoUseCase;

  HomeCubit(this.getAllImages, this.getAllTodos, this.deleteTodoUseCase)
      : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getDataImages() async {
    emit(WallpaperGetDataLoading());
    final images = await getAllImages();
    emit(WallpaperGetDataSuccess(image: images));
  }

  Future<void> getMoreImages() async {
    numOFImages = numOFImages + 6;
    final images = await getAllImages();
    emit(WallpaperGetDataSuccess(image: images));
  }

  void getDataTodo() async {
    emit(TodoGetDataLoading());
    final todos = await getAllTodos();
    emit(TodoGetDataSuccess(todo: todos));
  }

  bool hasLoading = false;

  Future<void> deleteTodo(int id) async {
    hasLoading = true;
    emit(TodoDeleteLoading());
    Future.delayed(const Duration(seconds: 1), () async {
      final todos = await deleteTodoUseCase(id);
      emit(TodoDeleteSuccess(todo: todos));
    });
  }
}
