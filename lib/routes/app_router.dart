import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/di/service_locator.dart';
import 'package:movie/feature/home/presentation/state/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:movie/feature/home/presentation/state/search_movie/search_movie_bloc.dart';
import 'package:movie/feature/home/presentation/ui/home.dart';

import 'app_router_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Pages.home.screenPath,
        name: Pages.home.screenName,
        builder: (_, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => service<BottomNavigationBarCubit>()),
            BlocProvider(create: (_) => service<SearchMovieBloc>()),
          ],
          child: const Home(),
        ),
      ),
    ],
  );
}
