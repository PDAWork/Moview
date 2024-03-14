import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/core/network/api_entry_points.dart';
import 'package:movie/core/network/app_interceptor.dart';
import 'package:movie/feature/home/data/data_source/remote_data_source.dart';
import 'package:movie/feature/home/data/repository/home_pepository_impl.dart';
import 'package:movie/feature/home/domain/repository/home_repository.dart';
import 'package:movie/feature/home/domain/use_case/search_use_case.dart';
import 'package:movie/feature/home/presentation/state/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:movie/feature/home/presentation/state/search_movie/search_movie_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final service = GetIt.instance;

Future<void> initDI() async {
  await dotenv.load(fileName: '.env');

  service.registerLazySingleton(
    () => Dio(
      BaseOptions(
        // TODO headers: {"X-API-KEY": dotenv.get('API_KEY')},
        baseUrl: ApiEntryPoints.baseUrl,
      ),
    )..interceptors.addAll(
        [
          AppInterceptor(),
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        ],
      ),
  );

  // Remote Local
  service.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: service()),
  );

  // Repository
  service.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: service()),
  );

  // Use Case
  service.registerFactory(() => SearchUseCase(repository: service()));

  // StateManagment
  service.registerFactory(() => BottomNavigationBarCubit());
  service.registerFactory(() => SearchMovieBloc(service()));
}
