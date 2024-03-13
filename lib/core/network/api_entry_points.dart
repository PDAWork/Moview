import 'package:flutter/foundation.dart';

base class ApiEntryPoints {
  static const String baseUrl = kDebugMode
      ? "https://api.kinopoisk.dev/ "
      : kProfileMode
          ? "https://api.kinopoisk.dev/ "
          : "https://api.kinopoisk.dev/ ";

  /// movie/search?page=1&limit=10&query=железный человек
  /// [page] номер страницы
  /// [limit] количество элементов на странице
  /// [query] название фильма
  static const String movieSearch = "/movie/search";
}
