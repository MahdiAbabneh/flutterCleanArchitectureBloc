import 'package:error_handler_project/core/network/dio_network.dart';
import 'package:error_handler_project/core/utils/endpoints.dart';
import 'package:error_handler_project/data/models/todo_model.dart';
import 'package:error_handler_project/domain/entities/todo_entity.dart';
import 'package:error_handler_project/injection.dart';

abstract class TodoRemoteDataSource {
  Future<List<Todo>> getAllTodos();
  Future<bool> deleteTodo(int id);

}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  @override
  Future<List<Todo>> getAllTodos() async {
    final response = await sl<NetworkDio>().getDataModelList<Todo>(
      endpoint: EndPoints.getTodos(),
      fromJson: (data) => TodoModel.fromJson(data),
    );
    return response;
  }

  @override
  Future<bool> deleteTodo(int id) async {
    final response = await sl<NetworkDio>()
        .deleteDataModel(endpoint: EndPoints.deleteTodos(id));
    return response;
  }
}
