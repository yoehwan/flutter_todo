library edit_bloc;

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo/model/todo.dart';
part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditState()) {
    on<EditCompleted>(_editCompleted);
  }

  FutureOr<void> _editCompleted(EditCompleted event, Emitter<EditState> emit) {
    emit(EditState(status: EditViewState.editCompleted, todo: event.todo));
  }
}
