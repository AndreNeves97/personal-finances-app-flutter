import 'package:flutter/widgets.dart';

abstract class AppSpacingStyles {
  static const double defaultPadding = 16;

  static const EdgeInsetsGeometry contentHorizontalPadding =
      EdgeInsets.symmetric(horizontal: defaultPadding);

  static const EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
      vertical: defaultPadding, horizontal: defaultPadding);
}
