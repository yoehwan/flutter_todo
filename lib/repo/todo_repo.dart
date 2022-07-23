import 'package:flutter_todo/data/database/tmp_database.dart';

abstract class TodoRepo {
  Future init();

  List<dynamic> todoList();

  Future<bool> updateTodo(dynamic index, dynamic data);

  Future<bool> removeTodo(dynamic index);

  Stream<DataEvent> stream();
}
