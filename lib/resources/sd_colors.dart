import 'package:flutter/material.dart';
import 'package:color_shade/color_shade.dart';

class SdColors {
  SdColors._();

  // Base Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Grey Tones
  static const Color grey = Colors.grey;
  static final Color grey50 = grey.shade50;
  static final Color grey100 = grey.shade100;
  static final Color grey200 = grey.shade200;
  static final Color grey300 = grey.shade300;
  static final Color grey400 = grey.shade400;
  static final Color grey500 = grey.shade500;
  static final Color grey600 = grey.shade600;
  static final Color grey700 = grey.shade700;
  static final Color grey800 = grey.shade800;
  static final Color grey900 = grey.shade900;

  static const Color greyText = Color(0xFFA1A5B7);

  // Black Text
  static const Color blackText = Color(0xFF000000);

  // Red Tones
  static const Color red = Color(0xFFF00000);

  // Primary
  static const Color primaryLight = Color(0xFF3674B5);
  static final Color primary50 = primaryLight.shade50;
  static final Color primary100 = primaryLight.shade100;
  static final Color primary200 = primaryLight.shade200;
  static final Color primary300 = primaryLight.shade300;
  static final Color primary400 = primaryLight.shade400;
  static final Color primary500 = primaryLight.shade500;
  static final Color primary600 = primaryLight.shade600;
  static final Color primary700 = primaryLight.shade700;
  static final Color primary800 = primaryLight.shade800;
  static final Color primary900 = primaryLight.shade900;

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
