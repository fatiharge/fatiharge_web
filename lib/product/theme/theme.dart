import 'package:fatiharge/product/theme/dark_color_schema.dart';
import 'package:fatiharge/product/theme/light_color_schema.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utility/manager/app_configuration_manager.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);

  final TextTheme textTheme;

  ThemeData light() => theme(lightColorSchema);

  ThemeData dark() => theme(darkColorSchema);

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        cardTheme: const CardTheme().copyWith(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConfigurationManager.instance.baseRadius.large,
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
