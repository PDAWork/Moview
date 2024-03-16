import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/movie/data/data_source/movie_local_data_source.dart';
import 'package:movie/feature/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movie/feature/movie/data/mapper/movie_information_entity_mapper.dart';
import 'package:movie/feature/movie/data/mapper/movie_information_model_mapper.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';
import 'package:movie/feature/movie/domain/repository/movie_repository.dart';

final class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  final MovieLocalDataSource _movieLocalDataSource;

  MovieRepositoryImpl({
    required MovieRemoteDataSource movieRemoteDataSource,
    required MovieLocalDataSource movieLocalDataSource,
  })  : _movieRemoteDataSource = movieRemoteDataSource,
        _movieLocalDataSource = movieLocalDataSource;

  @override
  Future<Either<Failure, MovieInformationEntity>> movie(int id) async {
    try {
      final result = await _movieRemoteDataSource.movie(id);

      return Right(result.toEntity());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> favorite(
    MovieInformationEntity movie,
    bool status,
  ) async {
    try {
      final result = await _movieLocalDataSource.getMovies(movie.id);
      if (status) {
        return Right(result);
      }
      if (result) {
        await _movieLocalDataSource.deleteMovie(movie.id);
        return const Right(false);
      } else {
        await _movieLocalDataSource.saveMovie(movie.toModel());
        return const Right(true);
      }
    } on CacheException catch (_) {
      return Left(CacheFailure());
    }
  }
}
