import 'package:movie/feature/home/data/model/item_model.dart';

base class MovieModel {
  final List<ItemModel> movies;
  final int page;
  final int pages;

  MovieModel({
    required this.movies,
    required this.pages,
    required this.page,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      movies: (json['docs'] as List)
          .map((element) => ItemModel.fromJson(element))
          .toList(),
      pages: json['pages'],
      page: json['page'],
    );
  }
}
