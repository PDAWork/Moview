import 'package:flutter/material.dart';
import 'package:movie/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
