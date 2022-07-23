import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/view/edit_view/edit_view.dart';
import 'package:flutter_todo/view/search_view/search_view.dart';
import 'package:flutter_todo/widget/todo_list_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  AppBar appBar() {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Navigator.of(context).push(SearchView.route());
          },
          icon: const Icon(Icons.search),
        );
      }),
      title: const Text("TodoList"),
    );
  }

  Widget body() {
    return BlocBuilder<TodoBloc, TodoState>(
      buildWhen: (previous, current) {
        return previous != current || current.status == TodosViewStatus.success;
      },
      builder: (context, state) {
        Widget todoItem(Todo todo) {
          return TodoListTile(
            todo: todo,
            onTapItem: () {
              Navigator.of(context).push(EditView.route(todo)).then((res) {
                if (res != null) {
                  BlocProvider.of<TodoBloc>(context).add(TodoUpdated(res));
                }
              });
            },
            onTapDeleted: () {
              BlocProvider.of<TodoBloc>(context).add(TodoRemoved(todo));
            },
          );
        }

        final list = state.todoList;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            return todoItem(list[index]);
          },
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

  Widget floatButton() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            BlocProvider.of<TodoBloc>(context).add(TodoCreated(Todo.empty()));
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
