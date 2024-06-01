import 'constant.dart';

class EndPoints {
  static String getImages() {
    return "https://api.pexels.com/v1/curated/?per_page=$numOFImages";
  }

  static String getTodos() {
    return "https://jsonplaceholder.typicode.com/todos";
  }

  static String deleteTodos(int id){
    return "https://jsonplaceholder.typicode.com/todos/$id";
  }

  static Map<String, dynamic> authorizationImages() {
    return {
      'Authorization': '3TDCtNcGheyNuWloH8Dd7cda0G9l0WqR4BYJfYYD8X0FgQkwaO3DlxXA'
    };
  }
}
