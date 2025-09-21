import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

class SdSafeArea extends StatelessWidget {
  const SdSafeArea({super.key, this.bgColor, required this.child});

  final Color? bgColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: bgColor ?? SdColors.white,
      child: SafeArea(child: child),
    );
  }
}
