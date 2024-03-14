import 'package:movie/feature/home/domain/entity/item_entity.dart';

final class MovieEntity {
  final List<ItemEntity> movieList;
  final int pages;
  int page;

  MovieEntity({
    required this.movieList,
    required this.pages,
    this.page = 1,
  });
}
