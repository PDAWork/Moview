import 'package:movie/feature/home/data/mapper/item_mapper.dart';
import 'package:movie/feature/home/data/model/movie_model.dart';
import 'package:movie/feature/home/domain/entity/movie_entity.dart';

extension MovieMapper on MovieModel {
  MovieEntity toEntity() {
    return MovieEntity(
        movieList: movies.map((element) => element.toEntity()).toList(),
        pages: pages);
  }
}
