import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData light({
    String? fontFamily,
    List<ThemeExtension<dynamic>>? extensions,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: fontFamily,
      extensions: [if (extensions != null) ...extensions],
    );
  }

  static ThemeData dark({
    String? fontFamily,
    List<ThemeExtension<dynamic>>? extensions,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      extensions: [if (extensions != null) ...extensions],
    );
  }
}
