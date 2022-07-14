library todo_bloc;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/view/edit_view/edit_view.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoCreated>(_onCreated);
    on<TodoUpdated>(_onUpdated);
    on<TodoDeleted>(_onDeleted);
  }

  FutureOr<void> _onUpdated(TodoUpdated event, Emitter<TodoState> emit) {
    // fix to update
    final item = event.item;
    emit(state.addItem(item));
  }

  FutureOr<void> _onDeleted(TodoDeleted event, Emitter<TodoState> emit) {}

  FutureOr<void> _onCreated(TodoCreated event, Emitter<TodoState> emit) {
    final item = event.item;
    emit(state.addItem(item));
  }

  Future<Todo?> onTapTodo({
    required BuildContext context,
    required Todo todo,
  }) async {
    final res = await Navigator.of(context).push(EditView.route(todo));
    return res;
  }
}
