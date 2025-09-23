import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';
import 'package:system_design_flutter/utils/sd_extensions.dart';
import 'package:system_design_flutter/widgets/icon/sd_icon.dart';

class SdImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final double? borderRadiusValue;
  final String imagePath;

  const SdImage({
    Key? key,
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
    this.borderRadiusValue,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRemoteImg = imagePath.startsWith('http');

    if (!isRemoteImg) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: Image.asset(
          imagePath!,
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
                borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
              ),
              child: SdIcon(iconData: Icons.broken_image, color: SdColors.grey),
            );
          },
        ),
      );
    } else if (isRemoteImg) {
      // TODO: handle UI for image URL
    }
    return SizedBox.shrink();
  }
}
