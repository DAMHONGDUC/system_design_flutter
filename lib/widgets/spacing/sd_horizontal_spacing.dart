import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_spacing.dart';

class SdVerticalSpacing extends StatelessWidget {
  const SdVerticalSpacing({super.key, this.value, this.xRatio = 1});
  final double? value;
  final double xRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: (value ?? SdSpacing.s12) * xRatio);
  }
}
