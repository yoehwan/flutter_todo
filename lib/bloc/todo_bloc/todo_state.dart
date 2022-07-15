part of todo_bloc;

enum TodosViewStatus {
  initial,
  loading,
  success,
  failure,
}

class TodoState extends Equatable {
  TodoState({
    this.status = TodosViewStatus.initial,
    List<Todo>? todoList,
  }) : todoList = todoList ?? [];
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
}
