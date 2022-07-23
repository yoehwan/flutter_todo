import 'package:flutter/material.dart';
import 'package:flutter_todo/model/todo.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    this.onTapItem,
    this.onTapDeleted,
  });

  final Todo todo;
  final VoidCallback? onTapItem;
  final VoidCallback? onTapDeleted;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapItem,
      title: Text("Title: ${todo.title}"),
      subtitle: Text("Desc: ${todo.desc}"),
      trailing: IconButton(
        onPressed: onTapDeleted,
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
