import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie/di/service_locator.dart';
import 'package:movie/routes/app_router.dart';

part  'app.dart';

class AppRunner {
  Future<void> run() async {
    runZonedGuarded(
      () async {
        await _initApp();
        runApp(const _App());
      },
      (error, stack) {
        log(error.toString(), error: error, stackTrace: stack);
        runApp(_AppWithError(message: 'error: $error, $stack'));
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDI();
    WidgetsBinding.instance.deferFirstFrame();
  }
}

