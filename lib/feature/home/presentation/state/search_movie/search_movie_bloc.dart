import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/home/domain/entity/movie_entity.dart';
import 'package:movie/feature/home/domain/use_case/search_use_case.dart';

part 'search_movie_event.dart';

part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchUseCase _useCase;

  SearchMovieBloc(this._useCase) : super(SearchMovieInitial()) {
    on<SearchMovieEvent>((event, emit) {});
    on<SearchPagination>((event, emit) async {
      if (state is SearchMovieSuccess) {
        final stateSave = (state as SearchMovieSuccess);
        MovieEntity movie = stateSave.movies;

        if (stateSave.movies.page == stateSave.movies.pages) {
          return;
        }
        stateSave.movies.page++;

        emit(stateSave.copyWith(isLoading: true));

        final result = await _useCase.call(SearchParam(
          query: event.query,
          currentPage: stateSave.movies.page,
        ));

        await Future.delayed(const Duration(milliseconds: 300));

        result.fold((l) => emit(SearchMovieError()), (newList) {
          emit(stateSave.copyWith(
            movies: movie..movieList.addAll(newList.movieList),
            isLoading: false,
          ));
        });
      }
    });
    on<SearchTextChanged>((event, emit) async {
      if (event.query.length < 3) {
        return emit(SearchMovieInitial());
      }

      emit(SearchMovieLoading());
      await Future.delayed(const Duration(milliseconds: 300));

      final result = await _useCase.call(SearchParam(query: event.query));

      result.fold(
        (error) => emit(SearchMovieError()),
        (movieList) => emit(SearchMovieSuccess(movies: movieList)),
      );
    });
  }
}
