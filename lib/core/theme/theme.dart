export 'colors.dart';
export 'text_styles.dart';
export 'dimensions.dart';
export 'shadows.dart';
export 'gradients.dart';

import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class WFTheme {
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: WFColors.base,
        colorScheme: const ColorScheme.dark(
          primary: WFColors.purple400,
          secondary: WFColors.purple300,
          surface: WFColors.base,
          onPrimary: WFColors.textPrimary,
          onSecondary: WFColors.textPrimary,
          onSurface: WFColors.textPrimary,
        ),
        textTheme: TextTheme(
          displayLarge: WFTextStyles.h1,
          displayMedium: WFTextStyles.h2,
          displaySmall: WFTextStyles.h3,
          headlineMedium: WFTextStyles.h4,
          headlineSmall: WFTextStyles.h5,
          bodyLarge: WFTextStyles.bodyLarge,
          bodyMedium: WFTextStyles.bodyMedium,
          bodySmall: WFTextStyles.bodySmall,
          labelLarge: WFTextStyles.labelLarge,
          labelMedium: WFTextStyles.labelMedium,
          labelSmall: WFTextStyles.labelSmall,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: WFColors.textPrimary,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: WFColors.purple500,
            foregroundColor: WFColors.textPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
}
