import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppThemes {
  static ThemeData get lightTheme {
    final referenceTheme = ThemeData.light();

    final theme = ThemeData(
      primarySwatch: AppColors.purplePalette,
      colorScheme: referenceTheme.colorScheme.copyWith(
        primary: AppColors.purplePalette,
        secondary: AppColors.amberPalette,
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      brightness: Brightness.light,
    );

    return copyWithGeneralProperties(theme);
  }

  static ThemeData copyWithGeneralProperties(ThemeData theme) {
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        titleLarge: AppTextStyles.titleLarge,
      ),
    );
  }
}
