part of search_bloc;

abstract class SearchEvent {}

class TodoSearchStarted extends SearchEvent {}

class TodoSearched extends SearchEvent {
  TodoSearched(this.query);
  final String query;
}
