import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/use_case/use_case.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';
import 'package:movie/feature/movie/domain/repository/movie_repository.dart';

final class MovieUseCase
    implements UseCase<Either<Failure, MovieInformationEntity>, int> {
  final MovieRepository _repository;

  MovieUseCase({required MovieRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, MovieInformationEntity>> call(int id) async {
    return await _repository.movie(id);
  }
}
