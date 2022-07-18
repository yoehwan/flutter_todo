import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/repo/todo_repo.dart';

class TodoUseCase {
  TodoUseCase(this.repo);
  final TodoRepo repo;

  Stream<List<Todo>> todoList() {
    return repo.todoList();
  }
}
