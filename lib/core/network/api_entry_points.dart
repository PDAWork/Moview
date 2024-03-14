import 'package:flutter/foundation.dart';

abstract final class ApiEntryPoints {
  static const String baseUrl = kDebugMode
      ? "https://api.kinopoisk.dev/v1.4/"
      : kProfileMode
          ? ""
          : "";

  /// movie/search?page=1&limit=10&query=железный человек
  /// [page] номер страницы
  /// [limit] количество элементов на странице
  /// [query] название фильма
  static const String movieSearch = "/movie/search";
}
