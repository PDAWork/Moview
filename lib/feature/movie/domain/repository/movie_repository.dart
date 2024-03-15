import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, MovieInformationEntity>> movie(int id);
}
