import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdImage extends StatelessWidget {
  const SdImage({super.key, required this.imgPath, this.width, this.height});
  final String imgPath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final size = SdSpacing.s24;

    return Image.asset(imgPath, width: width ?? size, height: height ?? size);
  }
}
