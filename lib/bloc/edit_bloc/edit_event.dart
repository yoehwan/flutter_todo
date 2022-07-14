part of edit_bloc;

abstract class EditEvent extends Equatable {}

class EditCompleted extends EditEvent {
  EditCompleted(this.todo);
  final Todo todo;

  @override
  List<Object?> get props => [todo];
}
