import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';
import 'package:movie/feature/movie/domain/use_case.dart/favorite_change_use_case.dart';

part 'favorite_change_state.dart';

class FavoriteChangeCubit extends Cubit<FavoriteChangeState> {
  FavoriteChangeCubit(this._useCase) : super(const FavoriteChangeState());
  final FavoriteChangeUseCase _useCase;

  void init(MovieInformationEntity param) async {
    final result = await _useCase.call(FavoriterChangeParam(
      entity: param,
      status: true,
    ));

    result.fold(
      (l) => emit(state.copyWith(FavoriteChangeStatus.unselect)),
      (value) => emit(
        state.copyWith(
          value ? FavoriteChangeStatus.select : FavoriteChangeStatus.unselect,
        ),
      ),
    );
  }

  void onChangeFavorite(MovieInformationEntity param) async {
    final result = await _useCase.call(FavoriterChangeParam(
      entity: param,
      status: false,
    ));
    emit(
      state.copyWith(state.status == FavoriteChangeStatus.select
          ? FavoriteChangeStatus.unselect
          : FavoriteChangeStatus.select),
    );
  }
}
