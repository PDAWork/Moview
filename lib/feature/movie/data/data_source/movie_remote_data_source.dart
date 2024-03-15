import 'package:dio/dio.dart';
import 'package:movie/core/error/exeption.dart';
import 'package:movie/core/network/api_entry_points.dart';
import 'package:movie/feature/movie/data/model/movie_information_model.dart';

abstract interface class MovieRemoteDataSource {
  Future<MovieInformationModel> movie(int id);
}

final class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio _dio;

  MovieRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MovieInformationModel> movie(int id) async {
    try {
      final result = await _dio.get("${ApiEntryPoints.movieInformation}/$id");
      return MovieInformationModel.fromJson(result.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
