part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState(this.favorite);
  final List<ItemEntity> favorite;

  FavoriteState copyWith(List<ItemEntity>? favorite) {
    return FavoriteSuccess(favorite ?? this.favorite);
  }

  @override
  List<Object> get props => [favorite];
}

final class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super([]);
}

final class FavoriteLoading extends FavoriteState {
  FavoriteLoading() : super([]);
}

final class FavoriteSuccess extends FavoriteState {
  const FavoriteSuccess(super.favorite);
}

final class FavoriteError extends FavoriteState {
  FavoriteError() : super([]);
}
