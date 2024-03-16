import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/use_case/use_case.dart';
import 'package:movie/feature/home/domain/entity/item_entity.dart';
import 'package:movie/feature/home/domain/repository/home_repository.dart';

final class FavoriteUseCase
    implements UseCase<Either<Failure, Stream<List<ItemEntity>>>, Unit> {
  final HomeRepository _repository;

  FavoriteUseCase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, Stream<List<ItemEntity>>>> call(Unit param) async {
    return _repository.favorite();
  }
}
