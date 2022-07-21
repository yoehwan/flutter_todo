import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/repo/todo_repo.dart';

class TodoUseCase {
  TodoUseCase(this.repo);
  final TodoRepo repo;

  Stream<List<Todo>> todoList() {
    return repo
        .todoList()
        .map((list) => list.map((item) => Todo.fromMap(item)).toList());
  }

  Future<bool> updateTodo(Todo todo) async {
    return repo.updateTodo(todo.index, todo.toMap());
  }

  Future<bool> removeTodo(int todoIndex) async {
    return repo.removeTodo(todoIndex);
  }
}
