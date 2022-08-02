import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: AppColors.purplePalette,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      brightness: Brightness.light,
    );
  }
}
