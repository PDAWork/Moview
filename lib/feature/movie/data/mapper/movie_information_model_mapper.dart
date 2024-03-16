import 'package:movie/feature/movie/data/mapper/person_mapper_model.dart';
import 'package:movie/feature/movie/data/model/movie_information_model.dart';
import 'package:movie/feature/movie/domain/entity/movie_information_entity.dart';

extension MovieInformationMapper on MovieInformationModel {
  MovieInformationEntity toEntity() {
    return MovieInformationEntity(
      id: id,
      poster: poster,
      name: name,
      description: description,
      year: year,
      votesKP: votesKP,
      ageRating: ageRating,
      genres: genres,
      fees: fees,
      premiere: premiere,
      persons: persons.map((e) => e.toEntity()).toList(),
      trailers: trailers,
    );
  }
}
