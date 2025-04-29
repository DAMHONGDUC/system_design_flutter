import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdIcon extends StatelessWidget {
  const SdIcon({
    super.key,
    required this.iconLocalPath,
    this.width,
    this.height,
  });
  final String iconLocalPath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconLocalPath,
      width: width ?? SdIconSize.size24,
      height: height ?? SdIconSize.size24,
    );
  }
}
