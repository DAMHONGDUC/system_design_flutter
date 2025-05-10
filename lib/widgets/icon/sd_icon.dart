import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

class SdIcon extends StatelessWidget {
  const SdIcon({super.key, this.iconData, this.iconPath, this.iconSize});
  final IconData? iconData;
  final String? iconPath;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final color = SdColors.iconColor;
    final size = iconSize ?? SdIconSize.size20;

    if (iconData != null) {
      return Icon(iconData, color: color, size: size);
    }

    if (iconPath.isNotNullAndNotEmpty) {
      return Image.asset(iconPath!, width: size, height: size);
    }

    return SizedBox.shrink();
  }
}
