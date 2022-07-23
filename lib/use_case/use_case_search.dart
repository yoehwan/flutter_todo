import 'dart:async';

import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/repo/todo_repo.dart';

class SearchUseCase {
  SearchUseCase(this.repo);
  final TodoRepo repo;

  final StreamController<List<Todo>> _streamController =
      StreamController.broadcast();

  Stream<List<Todo>> searhList() {
    return _streamController.stream;
  }

  Future search(String query) async {
    final List<Todo> todoList =
        repo.todoList().map((e) => Todo.fromMap(e)).toList();
    final List<Todo> resultList = [];

    for (final item in todoList) {
      if (item.title.contains(query) || item.desc.contains(query)) {
        resultList.add(item);
      }
    }
    print(resultList);
    _streamController.add(resultList);
  }
}
