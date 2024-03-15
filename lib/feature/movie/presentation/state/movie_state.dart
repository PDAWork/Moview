part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieSeccuss extends MovieState {
  final MovieInformationEntity movie;

  const MovieSeccuss({required this.movie});
}

final class MovieError extends MovieState {}
