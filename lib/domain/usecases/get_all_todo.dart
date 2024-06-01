import 'package:error_handler_project/domain/entities/todo_entity.dart';
import 'package:error_handler_project/domain/repositories/repo_todo.dart';

class GetAllTodoUseCase {
  final TodoRepositories repository;

  GetAllTodoUseCase(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getAllTodos();
  }
}
