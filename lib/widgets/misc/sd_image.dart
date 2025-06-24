import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';
import 'package:system_design_flutter/widgets/icon/sd_icon.dart';

class SdImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const SdImage({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: boxFit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.grey),
          ),
          child: SdIcon(iconData: Icons.broken_image, color: SdColors.grey),
        );
      },
    );
  }
}
