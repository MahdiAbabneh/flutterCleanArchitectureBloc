import 'package:error_handler_project/domain/entities/todo_entity.dart';

abstract class TodoRepositories {
  Future<List<Todo>> getAllTodos();
  Future<bool> deleteTodo(int id);
}
