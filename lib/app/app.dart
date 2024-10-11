import 'package:easy_localization/easy_localization.dart';
import 'package:fatiharge/product/manager/theme_manager.dart';
import 'package:fatiharge/product/route/route_manager.dart';
import 'package:fatiharge/product/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _routeManager = GetIt.instance<RouteManager>();
    // final brightness =
    // View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context);
    final theme = MaterialTheme(textTheme);
    return AnimatedBuilder(
      animation: ThemeManager.instance,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Fatiharge',
          restorationScopeId: 'app',
          onGenerateTitle: (BuildContext context) => 'Fatiharge',
          theme: theme.light(),
          darkTheme: theme.dark(),
          themeMode: ThemeManager.instance.themeMode,
          routerConfig: _routeManager.config(),
          builder: EasyLoading.init(),
        );
      },
    );
  }

  TextTheme createTextTheme(BuildContext context) {
    const fontName = 'Mali';
    final baseTextTheme = Theme.of(context).textTheme;
    final bodyTextTheme = GoogleFonts.getTextTheme(fontName, baseTextTheme);
    final displayTextTheme = GoogleFonts.getTextTheme(fontName, baseTextTheme);
    final textTheme = displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );
    return textTheme;
  }
}
