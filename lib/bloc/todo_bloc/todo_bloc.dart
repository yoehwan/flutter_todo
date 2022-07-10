library todo_bloc;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/model/todo.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoCreated>(_onCreated);
    on<TodoUpdated>(_onUpdated);
    on<TodoDeleted>(_onDeleted);
  }

  FutureOr<void> _onUpdated(TodoUpdated event, Emitter<TodoState> emit) {}

  FutureOr<void> _onDeleted(TodoDeleted event, Emitter<TodoState> emit) {}

  FutureOr<void> _onCreated(TodoCreated event, Emitter<TodoState> emit) {
    final item = event.item;
    print(state.todoList);
    emit(state.addItem(item));
  }
}
