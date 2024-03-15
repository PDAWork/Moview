import 'package:intl/intl.dart';
import 'package:movie/feature/movie/data/model/person_model.dart';

base class MovieInformationModel {
  final String poster;
  final String name;
  final String description;
  final int year;
  final int votesKP;
  final int ageRating;
  final List<String> genres;
  final int fees;
  final String premiere;
  final List<PersonModel> persons;
  final List<String> trailers;

  MovieInformationModel({
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

  factory MovieInformationModel.fromJson(Map<String, dynamic> json) {
    return MovieInformationModel(
      poster: json['poster']['url'],
      name: json['name'],
      description: json['description'],
      year: json['year'],
      votesKP: json['votes']["kp"],
      ageRating: json['ageRating'],
      genres: (json['genres'] as List)
          .map((element) => (element['name'] as String))
          .toList(),
      fees: json['fees']['russia']["value"] ?? 0,
      premiere: DateFormat("dd-MM-yyyy")
          .format(DateTime.parse(json['premiere']['russia'])),
      persons: (json['persons'] as List)
          .map((element) => PersonModel.fromJson(element))
          .toList(),
      trailers: (json['videos']['trailers'] as List)
          .map((element) => (element['url'] as String))
          .toList(),
    );
  }
}
