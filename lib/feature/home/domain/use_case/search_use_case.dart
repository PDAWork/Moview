import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/use_case/use_case.dart';
import 'package:movie/feature/home/domain/entity/movie_entity.dart';
import 'package:movie/feature/home/domain/repository/home_repository.dart';

final class SearchUseCase
    implements UseCase<Either<Failure, MovieEntity>, SearchParam> {
  final HomeRepository _repository;

  SearchUseCase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, MovieEntity>> call(SearchParam param) async {
    return await _repository.search(param.query, param.currentPage);
  }
}

base class SearchParam {
  final String query;
  final int currentPage;

  SearchParam({
    required this.query,
    this.currentPage = 1,
  });
}
