import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_todo/widget/todo_list_tile.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => SearchBloc()..add(TodoSearchStarted()),
          child: const SearchView(),
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("SearchView"),
    );
  }

  Widget searchTextField() {
    final TextEditingController searchController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                BlocProvider.of<SearchBloc>(context)
                    .add(TodoSearched(searchController.text));
              },
              child: Text("Search"),
            );
          },
        )
      ],
    );
  }

  Widget searchListView() {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (pre, curr) {
        return pre != curr || curr.status == SearchStatus.success;
      },
      builder: (context, state) {
        final list = state.result;
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              return TodoListTile(
                todo: list[index],
              );
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          searchTextField(),
          Expanded(child: searchListView()),
        ],
      ),
    );
  }
}
