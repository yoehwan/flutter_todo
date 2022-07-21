part of todo_bloc;

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class TodoInitialized extends TodoEvent {
  const TodoInitialized();
}

class TodoUpdated extends TodoEvent {
  const TodoUpdated(this.item);
  final Todo item;
}

class TodoCreated extends TodoEvent {
  const TodoCreated(this.item);
  final Todo item;
}

class TodoRemoved extends TodoEvent {
  const TodoRemoved(this.item);
  final Todo item;
}
