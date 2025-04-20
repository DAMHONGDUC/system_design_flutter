import 'package:flutter/material.dart';
import 'package:system_design_flutter/utils/sd_color_helper.dart';

class SdColors {
  SdColors._();

  // Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Grey Tones
  static const Color grey = Color(0xFF808080);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color greyText = Color(0xFFA1A5B7);

  // Black Text
  static const Color blackText = Color(0xFF000000);

  // Red Tones
  static const Color red = Color(0xFFF00000);

  // Primary
  static const Color primaryLight = Color(0xFF3674B5);
  static final List<Color> _shades = SdColorHelper.generateShades(primaryLight);
  static final Color primary100 = _shades[8];
  static final Color primary200 = _shades[7];
  static final Color primary300 = _shades[6];
  static final Color primary400 = _shades[5];
  static final Color primary500 = _shades[4];
  static final Color primary600 = _shades[3];
  static final Color primary700 = _shades[2];
  static final Color primary800 = _shades[1];
  static final Color primary900 = _shades[0];

  // Backgrounds
  static const Color primaryBackground = Color(0xFFF6F8FA);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  static const Color snowMist = Color(0xFFFAFAFA);

  // Icons
  static const Color icon = Color(0xFF5F6367);

  // Toasts / Status
  static const Color success = Color(0xFF48AA54);
  static const Color error = Color(0xFFE7443C);
  static const Color info = Color(0xFF02AFCD);
  static const Color warning = Color(0xFFF2940B);
}
