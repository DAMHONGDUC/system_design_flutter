import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? textColor;
  final double? height;

  const SdButton({
    super.key,
    required this.text,
    required this.onTap,
    this.bgColor,
    this.textColor = SdColors.white,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MoonFilledButton(
      label: Text(
        text,
        style: SdTextStyle.bodyMedium().copyWith(color: textColor),
      ),
      backgroundColor: bgColor,
      isFullWidth: true,
      onTap: onTap,
    );
  }
}
