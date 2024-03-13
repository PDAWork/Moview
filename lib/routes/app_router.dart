import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/feature/home/presentation/ui/home.dart';

import 'app_router_utils.dart';

class AppRouter{
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Pages.home.screenPath,
        name: Pages.home.screenName,
        builder: (_, state) => const Home(),
      ),
    ],
  );

}