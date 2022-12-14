import 'package:flutter/material.dart';

abstract class AppColors {
  static const purplePalette = Colors.purple;
  static const amberPalette = Colors.amber;
  static const greyPalette = Colors.grey;

  static final purple = purplePalette.shade500;

  static final lightGrey = greyPalette.shade300;
  static final darkerGrey = greyPalette.shade600;

  static final Color scaffoldBackground = greyPalette.shade50;
}
