import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle basic = const TextStyle();

  static TextStyle bold = basic.copyWith(
    fontWeight: FontWeight.bold,
  );

  static final TextStyle titleLarge = bold.copyWith(
    fontSize: 16,
  );
}
