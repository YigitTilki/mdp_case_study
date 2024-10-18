import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

@immutable
final class ApplicationInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  static Future<void> _initialize() async {
    ///For Localization
    await EasyLocalization.ensureInitialized();

    ///System Utils
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    FlutterError.onError = (details) {
      Logger().e(
        details.exceptionAsString(),
      );
    };
  }
}
