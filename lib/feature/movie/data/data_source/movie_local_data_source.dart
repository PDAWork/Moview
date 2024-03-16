import 'package:dartz/dartz.dart';
import 'package:movie/core/database/app_data_base.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/feature/movie/data/model/movie_information_model.dart';

abstract interface class MovieLocalDataSource {
  Future<Unit> saveMovie(MovieInformationModel movie);
  Future<Unit> deleteMovie(int id);
  Future<bool> getMovies(int id);
}

final class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final AppDatabase _appDatabase;

  MovieLocalDataSourceImpl({required AppDatabase appDatabase})
      : _appDatabase = appDatabase;

  @override
  Future<Unit> deleteMovie(int id) async {
    try {
      await (_appDatabase.delete(_appDatabase.movieTable)
            ..where((tbl) => tbl.id.equals(id)))
          .go();
      return Future.value(unit);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> getMovies(int id) async {
    try {
      final result = await _appDatabase.select(_appDatabase.movieTable).get();
      return await Future.value(
          result.where((element) => element.id == id).isNotEmpty);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<Unit> saveMovie(MovieInformationModel movie) async {
    try {
      await _appDatabase.into(_appDatabase.movieTable).insert(
            MovieTableCompanion.insert(
              id: movie.id,
              name: movie.name,
              description: movie.description,
              ageRating: movie.ageRating,
            ),
          );
      return Future.value(unit);
    } catch (e) {
      throw CacheException();
    }
  }
}
