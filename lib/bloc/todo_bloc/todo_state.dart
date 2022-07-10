part of todo_bloc;

enum TodosViewStatus {
  initial,
  loading,
  success,
  failure,
}

class TodoState extends Equatable {
  const TodoState({
    this.status = TodosViewStatus.initial,
    this.todoList = const [],
  });
  final TodosViewStatus status;
  final List<Todo> todoList;
  @override
  List<Object?> get props => [status, todoList];

  TodoState copyWith({
    TodosViewStatus? status,
    List<Todo>? todoList,
  }) {
    return TodoState(
      status: status ?? this.status,
      todoList: todoList ?? this.todoList,
    );
  }

  TodoState addItem(Todo item) {
    final list = [...todoList, item];
    return copyWith(todoList: list);
  }
}
