import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppThemes {
  static ThemeData get lightTheme {
    return _baseTheme.copyWith(
      colorScheme: _baseTheme.colorScheme.copyWith(
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
  }

  static ThemeData get _baseTheme {
    final baseTextTheme = ThemeData.light().textTheme;

    return ThemeData(
      textTheme: baseTextTheme.copyWith(
        titleLarge: AppTextStyles.titleLarge,
      ),
    );
  }
}
