import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';
import 'package:movie/feature/movie/domain/use_case.dart/movie_use_case.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieUseCase _useCase;
  MovieCubit(this._useCase) : super(MovieInitial());

  void init(int id) async {
    emit(MovieLoading());
    final result = await _useCase(id);
    result.fold(
      (error) => emit(MovieError()),
      (element) => emit(MovieSeccuss(movie: element)),
    );
  }
}
