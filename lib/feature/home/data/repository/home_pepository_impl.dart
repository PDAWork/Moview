import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/home/data/data_source/remote_data_source.dart';
import 'package:movie/feature/home/data/mapper/movie_mapper.dart';
import 'package:movie/feature/home/domain/entity/movie_entity.dart';
import 'package:movie/feature/home/domain/repository/home_repository.dart';

final class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl({required HomeRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, MovieEntity>> search(
    String query,
    int currentPage,
  ) async {
    try {
      final result = await _remoteDataSource.search(query, currentPage);
      return Right(result.toEntity());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> favorite() {
    // TODO: implement favorite
    throw UnimplementedError();
  }
}
