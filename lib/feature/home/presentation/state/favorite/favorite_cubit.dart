import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/feature/home/domain/entity/item_entity.dart';
import 'package:movie/feature/home/domain/use_case/favorite_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteUseCase _useCase;
  FavoriteCubit(this._useCase) : super(FavoriteInitial()) {}

  void init() async {
    emit(FavoriteLoading());
    final result = await _useCase.call(unit);
    result.fold(
      (l) => emit(FavoriteError()),
      (value) => value.listen(
        (event) {
          emit(state.copyWith(event));
        },
      ),
    );
  }
}
