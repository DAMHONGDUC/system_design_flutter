import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SdTag extends StatelessWidget {
  final String label;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final TextStyle? textStyle;

  const SdTag({
    super.key,
    required this.label,
    this.color = const Color(0xFF00ACC1),
    this.padding = const EdgeInsets.symmetric(
      horizontal: SdSpacing.s12,
      vertical: SdSpacing.s6,
    ),
    this.borderRadius = SdSpacing.s12,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: SdColors.transparent,
        border: Border.all(color: color, width: SdSpacing.s1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        label,
        style: textStyle ?? SdTextStyle.body10().wColor(color),
      ),
    );
  }
}
