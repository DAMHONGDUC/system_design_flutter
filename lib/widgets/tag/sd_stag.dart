import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SdTag extends StatelessWidget {
  final String label;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double borderRadiusValue;
  final TextStyle? textStyle;

  const SdTag({
    super.key,
    required this.label,
    this.color = SdColors.black,
    this.padding = const EdgeInsets.symmetric(
      horizontal: SdSpacing.s12,
      vertical: SdSpacing.s6,
    ),
    this.borderRadiusValue = SdSpacing.s100,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: SdColors.transparent,
        border: Border.all(color: color, width: SdSpacing.s1),
        borderRadius: BorderRadius.circular(borderRadiusValue),
      ),
      child: Text(
        label,
        style: textStyle ?? SdTextStyle.body10().wColor(color),
      ),
    );
  }
}
