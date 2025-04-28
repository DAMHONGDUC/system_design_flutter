import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

class SdDivider extends StatelessWidget {
  const SdDivider({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? SdColors.grey400);
  }
}
