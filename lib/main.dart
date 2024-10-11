import 'package:easy_localization/easy_localization.dart';
import 'package:fatiharge/app/app.dart';
import 'package:fatiharge/product/route/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uikit/utility/manager/app_configuration_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  AppConfigurationManager.init();

  GetIt.instance.registerSingleton<RouteManager>(RouteManager());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('tr', 'TR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('tr', 'TR'),
      child: const App(),
    ),
  );
}
