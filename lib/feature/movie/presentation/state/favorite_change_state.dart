part of 'favorite_change_cubit.dart';

enum FavoriteChangeStatus {
  select,
  unselect,
}

final class FavoriteChangeState extends Equatable {
  const FavoriteChangeState([this.status = FavoriteChangeStatus.unselect]);

  final FavoriteChangeStatus status;

  FavoriteChangeState copyWith(FavoriteChangeStatus? status) {
    return FavoriteChangeState(status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
