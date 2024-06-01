

import 'package:error_handler_project/domain/entities/todo_entity.dart';

class TodoModel extends Todo {
  const TodoModel(
      {required super.userId,
      required super.id,
      required super.title,
      required super.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"]);
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
