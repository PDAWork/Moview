import "package:dartz/dartz.dart";
import "package:movie/core/error/failure.dart";
import "package:movie/feature/home/domain/entity/item_entity.dart";
import "package:movie/feature/home/domain/entity/movie_entity.dart";

abstract interface class HomeRepository {
  Future<Either<Failure, MovieEntity>> search(
    String query,
    int currentPage,
  );

  Either<Failure, Stream<List<ItemEntity>>> favorite();
}
