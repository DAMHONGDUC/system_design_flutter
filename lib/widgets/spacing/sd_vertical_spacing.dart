import 'package:flutter/material.dart';
import 'package:system_design_flutter/theme/theme.dart';

class SdHorizontalSpacing extends StatelessWidget {
  const SdHorizontalSpacing({super.key, this.value});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value ?? SdThemeConstants.spacing12);
  }
}
