import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter_todo/model/todo.dart';

class EditView extends StatefulWidget {
  EditView({
    Key? key,
    required this.todo,
  })  : titleController = TextEditingController(text: todo.title),
        descController = TextEditingController(text: todo.desc),
        super(key: key);

  final Todo todo;
  final TextEditingController titleController;
  final TextEditingController descController;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  AppBar appBar() {
    return AppBar(
      title: const Text("EditView"),
    );
  }

  Widget body() {
    Widget titleTextField() {
      return TextField(
        controller: widget.titleController,
      );
    }

    Widget descTextField() {
      return TextField(
        controller: widget.descController,
      );
    }

    Widget buttons() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              final item = widget.todo.copyWith(
                title: widget.titleController.text,
                desc: widget.descController.text,
              );
              context.read<TodoBloc>().add(TodoUpdated(item));
              // BlocProvider.of<TodoBloc>(context).add(TodoUpdated(item));
            },
            child: Text("Save"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
        ],
      );
    }

    return Column(
      children: [
        titleTextField(),
        descTextField(),
        buttons(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}
