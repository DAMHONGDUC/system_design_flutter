import 'package:flutter/material.dart';
import 'package:system_design_flutter/theme/sd_theme_constant.dart';

class SdVerticalSpacing extends StatelessWidget {
  const SdVerticalSpacing({super.key, this.value});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value ?? SdThemeConstants.spacing12);
  }
}
