library search_bloc;

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/repo/todo_impl.dart';
import 'package:flutter_todo/use_case/use_case_search.dart';

part 'search_state.dart';
part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<TodoSearchStarted>(_started);
    on<TodoSearched>(_search);
  }

  final SearchUseCase useCase = SearchUseCase(TodoImpl());

  Future<FutureOr<void>> _started(TodoSearchStarted event, Emitter<SearchState> emit) async {
   await emit.forEach<List<Todo>>(
      useCase.searhList(),
      onData: (data) {
        return state.copyWith(
          status: SearchStatus.success,
          result: data,
        );
      },
    );
  }

  FutureOr<void> _search(TodoSearched event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    await useCase.search(event.query);
  }
}
