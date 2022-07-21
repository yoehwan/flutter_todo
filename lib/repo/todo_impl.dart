import 'dart:async';

import 'package:flutter_todo/repo/todo_repo.dart';

class TodoImpl implements TodoRepo {
  final Map<dynamic, dynamic> _tmpDBList = {};

  final StreamController<List<dynamic>> _todoListController =
      StreamController();

  void _notifyStream() {
    _todoListController.add(_tmpDBList.values.toList());
  }

  @override
  Future init() async {
    _notifyStream();
  }

  @override
  Stream<List> todoList() {
    return _todoListController.stream;
  }

  @override
  Future<bool> updateTodo(dynamic index, data) async {
    try {
      _tmpDBList[index] = data;
      _notifyStream();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> removeTodo(dynamic index) async {
    try {
      _tmpDBList.remove(index);
      _notifyStream();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
