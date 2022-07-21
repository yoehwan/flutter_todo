abstract class TodoRepo {
  Future init();

  Stream<List<dynamic>> todoList();

  Future<bool> updateTodo(dynamic index, dynamic data);

  Future<bool> removeTodo(dynamic index);
}
