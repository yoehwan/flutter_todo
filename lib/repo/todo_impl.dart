import 'dart:async';

import 'package:flutter_todo/data/database/tmp_database.dart';
import 'package:flutter_todo/repo/todo_repo.dart';

class TodoImpl implements TodoRepo {
  final TmpDataBase dataBase = TmpDataBase();

  @override
  Future init() async {}

  @override
  Stream<DataEvent> stream() {
    return dataBase.stream();
  }

  @override
  List<dynamic> todoList() {
    final list = dataBase.dataList;
    return list;
  }

  @override
  Future<bool> updateTodo(dynamic index, data) async {
    try {
      dataBase.update(index, data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> removeTodo(dynamic index) async {
    try {
      dataBase.remove(index);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
