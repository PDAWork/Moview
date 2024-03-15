import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movie/feature/movie/data/mapper/movie_information_mapper.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';
import 'package:movie/feature/movie/domain/repository/movie_repository.dart';

final class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;

  MovieRepositoryImpl({required MovieRemoteDataSource movieRemoteDataSource})
      : _movieRemoteDataSource = movieRemoteDataSource;

  @override
  Future<Either<Failure, MovieInformationEntity>> movie(int id) async {
    try {
      final result = await _movieRemoteDataSource.movie(id);

      return Right(result.toEntity());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}
