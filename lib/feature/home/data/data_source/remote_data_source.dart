import 'package:dio/dio.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/core/network/api_entry_points.dart';
import 'package:movie/feature/home/data/model/movie_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<MovieModel> search(
    String query,
    int currentPage,
  );
}

final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MovieModel> search(String query, int currentPage) async {
    try {
      final result = await _dio.get(
        ApiEntryPoints.movieSearch,
        queryParameters: {
          "query":query,
          "page": currentPage,
          "limit": 10,
        },
      );
      return MovieModel.fromJson(result.data);
    } catch (e) {
      throw ServerException();
    }
  }
}

