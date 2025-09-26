import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_spacing.dart';

class SdVerticalSpacing extends StatelessWidget {
  const SdVerticalSpacing({
    super.key,
    this.value,
    this.xRatio = 1,
    this.bgColor,
  });
  final double? value;
  final double xRatio;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    if (bgColor != null) {
      return Container(
        height: (value ?? SdSpacing.s12) * xRatio,
        color: bgColor,
      );
    }
    return SizedBox(height: (value ?? SdSpacing.s12) * xRatio);
  }
}
