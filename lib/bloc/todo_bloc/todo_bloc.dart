library todo_bloc;

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/repo/todo_impl.dart';
import 'package:flutter_todo/use_case/use_case_todo.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<TodoInitialized>(_onInit);
    on<TodoCreated>(_onCreated);
    on<TodoUpdated>(_onUpdated);
    on<TodoRemoved>(_onRemoved);
  }
  final TodoUseCase useCase = TodoUseCase(TodoImpl());

  FutureOr<void> _onInit(TodoInitialized event, Emitter<TodoState> emit) async {
    await emit.forEach<List<Todo>>(
      useCase.todoList(),
      onData: (List<Todo> data) {
        return state.copyWith(
          status: TodosViewStatus.success,
          todoList: data,
        );
      },
    );
  }

  FutureOr<void> _onUpdated(TodoUpdated event, Emitter<TodoState> emit) async {
    await useCase.updateTodo(event.item);
  }

  FutureOr<void> _onRemoved(TodoRemoved event, Emitter<TodoState> emit) async {
    await useCase.removeTodo(event.item.index);
  }

  FutureOr<void> _onCreated(TodoCreated event, Emitter<TodoState> emit) async {
    await useCase.updateTodo(event.item);
  }
}
