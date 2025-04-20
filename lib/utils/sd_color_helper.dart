import 'package:flutter/material.dart';

class SdColorHelper {
  static List<Color> generateShades(Color baseColor) {
    List<Color> shades = [];

    // Convert to HSL for lightness manipulation
    final baseHSL = HSLColor.fromColor(baseColor);

    // Generate 9 shades from -0.4 to +0.4 lightness delta
    for (double i = -0.4; i <= 0.4; i += 0.1) {
      final adjustedLightness = (baseHSL.lightness + i).clamp(0.0, 1.0);
      final hsl = baseHSL.withLightness(adjustedLightness);
      shades.add(hsl.toColor());
    }

    return shades;
  }
}
