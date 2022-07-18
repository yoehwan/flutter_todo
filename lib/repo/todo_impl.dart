import 'dart:async';

import 'package:flutter_todo/repo/todo_repo.dart';

class TodoImpl implements TodoRepo {
  final StreamController<List<dynamic>> _todoListController =
      StreamController();

  @override
  Future init() async {
    _todoListController.add([]);
  }

  @override
  Stream<List> todoList() {
    return _todoListController.stream;
  }
}
