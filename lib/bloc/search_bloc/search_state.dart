part of search_bloc;

enum SearchStatus {
  initial,
  loading,
  success,
  failure,
}

class SearchState extends Equatable {
  SearchState({
    this.status = SearchStatus.initial,
    List<Todo>? result,
  }) : result = result ?? [];
  final SearchStatus status;
  final List<Todo> result;

  @override
  List<Object?> get props => [status, result];

  SearchState copyWith({
    SearchStatus? status,
    List<Todo>? result,
  }) {
    return SearchState(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }
}
