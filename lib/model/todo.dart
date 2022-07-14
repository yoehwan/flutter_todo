class Todo {
  const Todo({
    required this.index,
    this.title = "",
    this.desc = "",
  });
  final int index;
  final String title;
  final String desc;

  Todo copyWith({
    required String? title,
    required String? desc,
  }) {
    return Todo(
      index: index,
      title: title ?? this.title,
      desc: desc ?? this.desc,
    );
  }

  factory Todo.empty() {
    final index = DateTime.now().millisecondsSinceEpoch & 0xFFFFFF;
    return Todo(index: index);
  }
}
