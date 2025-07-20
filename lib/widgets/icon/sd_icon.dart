import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_design_flutter/index.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

class SdIcon extends StatelessWidget {
  const SdIcon({
    super.key,
    this.iconData,
    this.iconPath,
    this.iconSize,
    this.color,
  });

  final IconData? iconData;
  final String? iconPath;
  final double? iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final size = iconSize ?? SdSpacing.s24;
    final iconColor = color ?? SdColors.grey600;

    if (iconData != null) {
      return Icon(iconData, color: iconColor, size: size);
    }

    if (iconPath.isNotNullAndNotEmpty) {
      if (iconPath!.toLowerCase().endsWith('.svg')) {
        return SvgPicture.asset(
          iconPath!,
          width: size,
          height: size,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
      } else {
        return Image.asset(iconPath!, width: size, height: size);
      }
    }

    return const SizedBox.shrink();
  }
}
