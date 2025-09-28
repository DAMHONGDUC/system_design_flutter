import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_spacing.dart';

class SdFadingIcon extends StatelessWidget {
  final IconData iconData;
  final Color? bgColor;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onTap;

  const SdFadingIcon({
    super.key,
    required this.iconData,
    this.bgColor,
    this.iconColor,
    this.iconSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SdSpacing.s8),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          padding: const EdgeInsets.all(SdSpacing.s6),
          child: Icon(
            iconData,
            color: iconColor,
            size: iconSize ?? SdSpacing.s24,
          ),
        ),
      ),
    );
  }
}
