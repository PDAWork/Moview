part of 'search_movie_bloc.dart';

@immutable
sealed class SearchMovieEvent {}

final class SearchTextChanged extends SearchMovieEvent {
  final String query;

  SearchTextChanged({required this.query});
}

final class SearchPagination extends SearchMovieEvent {
  final String query;

  SearchPagination({required this.query});
}
