class Todo {
  Todo({
    required this.index,
    required this.title,
    required this.desc,
    required this.typeIndex,
  });
  final int index;
  final String title;
  final String desc;
  final int typeIndex;

  Todo copyWith({
    required String? title,
    required String? desc,
  }) {
    return Todo(
      index: index,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      typeIndex: typeIndex,
    );
  }
}
