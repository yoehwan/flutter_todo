import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/view/edit_view/edit_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  AppBar appBar() {
    return AppBar(
      title: const Text("TodoList"),
    );
  }

  Widget body() {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) {
        return current.status==TodosViewStatus.success;
      },
      builder: (context, state) {
        final list = state.todoList;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            final item = list[index];
            return ListTile(
              onTap: () async {
                final res =
                    await Navigator.of(context).push(EditView.route(item));
                if (res != null) {
                  // it can be bug?
                  BlocProvider.of<TodoBloc>(context).add(TodoUpdated(res));
                }
              },
              title: Text("Index: ${item.index}"),
              subtitle: Text("Title: ${item.title}"),
            );
          },
        );
      },
    );
  }

  Widget floatButton() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            final time = DateTime.now().millisecondsSinceEpoch;
            context.read<TodoBloc>().add(
                  TodoCreated(
                    Todo(
                      title: '$time',
                      desc: '',
                      index: time,
                    ),
                  ),
                );
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: floatButton(),
    );
  }
}
