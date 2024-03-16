import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/home/data/data_source/home_local_data_source.dart';
import 'package:movie/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movie/feature/home/data/mapper/item_mapper.dart';
import 'package:movie/feature/home/data/mapper/movie_mapper.dart';
import 'package:movie/feature/home/data/model/item_model.dart';
import 'package:movie/feature/home/domain/entity/item_entity.dart';
import 'package:movie/feature/home/domain/entity/movie_entity.dart';
import 'package:movie/feature/home/domain/repository/home_repository.dart';

final class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepositoryImpl({
    required HomeRemoteDataSource remoteDataSource,
    required HomeLocalDataSource homeLocalDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _homeLocalDataSource = homeLocalDataSource;

  @override
  Future<Either<Failure, MovieEntity>> search(
    String query,
    int currentPage,
  ) async {
    try {
      final result = await _remoteDataSource.search(query, currentPage);
      return Right(result.toEntity());
    } on NetworkException catch (_) {
      return Left(NetworkFailure());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Stream<List<ItemEntity>>> favorite() {
    try {
      final result = _homeLocalDataSource.movieFavorite();

      return right(result.asyncMap(
        (event) => event.map((e) => e.toEntity()).toList(),
      ));
    } on CacheFailure catch (_) {
      return left(CacheFailure());
    }
  }
}
