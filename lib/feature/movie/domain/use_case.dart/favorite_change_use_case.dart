import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/use_case/use_case.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';
import 'package:movie/feature/movie/domain/repository/movie_repository.dart';

class FavoriteChangeUseCase
    implements UseCase<Either<Failure, bool>, FavoriterChangeParam> {
  final MovieRepository _repository;

  FavoriteChangeUseCase({required MovieRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, bool>> call(FavoriterChangeParam param) async {
    return await _repository.favorite(param.entity,param.status);
  }
}

class FavoriterChangeParam {
  final MovieInformationEntity entity;
  final bool status;

  FavoriterChangeParam({
    required this.entity,
    required this.status,
  });
}
