import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.index,
    this.title = "",
    this.desc = "",
  });
  final int index;
  final String title;
  final String desc;

  Todo copyWith({
    String? title,
    String? desc,
  }) {
    return Todo(
      index: index,
      title: title ?? this.title,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'title': title,
      'desc': desc,
    };
  }

  factory Todo.empty() {
    final index = DateTime.now().millisecondsSinceEpoch & 0xFFFFFF;
    return Todo(index: index,title: "$index");
  }

  @override
  List<Object?> get props => [index,title,desc];
}
