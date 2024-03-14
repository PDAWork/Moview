part of 'search_movie_bloc.dart';

@immutable
sealed class SearchMovieState {}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoading extends SearchMovieState {}

final class SearchMovieSuccess extends SearchMovieState {
  final MovieEntity movies;
  final bool isLoading;

  SearchMovieSuccess({
    required this.movies,
    this.isLoading = false,
  });

  SearchMovieSuccess copyWith({
    MovieEntity? movies,
    bool isLoading = false,
  }) {
    return SearchMovieSuccess(
      movies: movies ?? this.movies,
      isLoading: isLoading,
    );
  }
}

final class SearchMovieError extends SearchMovieState {}
