import 'package:error_handler_project/domain/repositories/repo_todo.dart';

class DeleteTodoUseCase {
  final TodoRepositories repository;

  DeleteTodoUseCase(this.repository);

  Future<bool> call(int todoId) async {
    return await repository.deleteTodo(todoId);
  }
}
