part of edit_bloc;

enum EditViewState {
  initial,
  editCompleted,
}

class EditState extends Equatable {
   EditState({
    this.status = EditViewState.initial,
    Todo? todo,
  }) : todo = todo ?? Todo.empty();
  final EditViewState status;
  final Todo todo;

  @override
  List<Object?> get props => [status, todo];
}
