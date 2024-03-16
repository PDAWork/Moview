import 'package:movie/core/database/app_data_base.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/feature/home/data/model/item_model.dart';

abstract interface class HomeLocalDataSource {
  Stream<List<ItemModel>> movieFavorite();
}

final class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final AppDatabase _appDatabase;

  HomeLocalDataSourceImpl({required AppDatabase appDatabase})
      : _appDatabase = appDatabase;

  @override
  Stream<List<ItemModel>> movieFavorite() async* {
    try {
      _appDatabase.select(_appDatabase.movieTable).watch().listen((event) {
        print(event);
      });

      yield* _appDatabase
          .select(_appDatabase.movieTable)
          .watch()
          .asyncMap((event) => event
              .map(
                (e) => ItemModel(
                  id: e.id,
                  name: e.name,
                  shortDescription: e.description,
                  ratingKP: e.ageRating,
                ),
              )
              .toList());
      // final list = await _appDatabase.select(_appDatabase.movieTable).get();
      // return list
      //     .map(
      //       (e) => ItemModel(
      //         id: e.id,
      //         name: e.name,
      //         shortDescription: e.description,
      //         ratingKP: e.ageRating,
      //       ),
      //     )
      //     .toList();
    } on CacheException catch (_) {
      throw CacheException();
    }
  }
}
