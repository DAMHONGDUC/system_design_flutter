import 'package:flutter/material.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdHorizontalSpacing extends StatelessWidget {
  const SdHorizontalSpacing({super.key, this.value, this.xRatio = 1});
  final double? value;
  final double xRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: (value ?? SdSpacingConstants.spacing12) * xRatio);
  }
}
