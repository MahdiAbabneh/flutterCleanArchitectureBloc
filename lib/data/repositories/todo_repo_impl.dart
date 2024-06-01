import 'package:error_handler_project/data/datasources/todo_remote.dart';
import 'package:error_handler_project/domain/entities/todo_entity.dart';
import 'package:error_handler_project/domain/repositories/repo_todo.dart';

class TodoRepoImpl implements TodoRepositories {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Todo>> getAllTodos() async {
    final remoteTodos = await remoteDataSource.getAllTodos();
    return remoteTodos;
  }

  @override
  Future<bool> deleteTodo(int id) async {
    final remoteTodos = await remoteDataSource.deleteTodo(id);
    return remoteTodos;
  }
}
