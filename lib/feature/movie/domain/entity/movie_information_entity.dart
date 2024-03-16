import 'package:movie/feature/movie/domain/entity/persont_entity.dart';

base class MovieInformationEntity {
  final int id;
  final String poster;
  final String name;
  final String description;
  final int year;
  final int votesKP;
  final int ageRating;
  final List<String> genres;
  final int fees;
  final String premiere;
  final List<PersonEntity> persons;
  final List<String> trailers;

  MovieInformationEntity({
    required this.id,
    required this.poster,
    required this.name,
    required this.description,
    required this.year,
    required this.votesKP,
    required this.ageRating,
    required this.genres,
    required this.fees,
    required this.premiere,
    required this.persons,
    required this.trailers,
  });
}
