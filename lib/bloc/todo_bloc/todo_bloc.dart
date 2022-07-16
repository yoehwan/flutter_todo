library todo_bloc;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/model/todo.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<TodoCreated>(_onCreated);
    on<TodoUpdated>(_onUpdated);
    on<TodoRemoved>(_onRemoved);
  }

  FutureOr<void> _onUpdated(TodoUpdated event, Emitter<TodoState> emit) {
    // fix to update
    final item = event.item;
    final list = [...state.todoList];
    final index = list.indexWhere((e) => e.index == item.index);
    list[index] = item;
    emit(state.copyWith(status: TodosViewStatus.success, todoList: list));
  }

  FutureOr<void> _onRemoved(TodoRemoved event, Emitter<TodoState> emit) {
    final item = event.item;
    final list = [...state.todoList];
    list.remove(item);
    emit(state.copyWith(status: TodosViewStatus.success, todoList: list));
  }

  FutureOr<void> _onCreated(TodoCreated event, Emitter<TodoState> emit) {
    final item = event.item;
    final list = [...state.todoList, item];
    emit(state.copyWith(status: TodosViewStatus.success, todoList: list));
  }
}
