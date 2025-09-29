import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';
import 'package:system_design_flutter/resources/sd_spacing.dart';
import 'package:system_design_flutter/utils/utils.dart';
import 'package:system_design_flutter/widgets/image/sd_image.dart';

class SdVideoPlaceHolder extends StatelessWidget {
  final String videoPath;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isAsset;

  const SdVideoPlaceHolder({
    super.key,
    required this.videoPath,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SdAssetHelper.getVideoThumbnailFromAsset(videoPath: videoPath),
      builder: (context, snapshot) {
        final imagePath = snapshot.data;

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: SdColors.grey,
            borderRadius: BorderRadius.circular(SdSpacing.s8),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (imagePath != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(SdSpacing.s8),
                  child: SdImage(
                    imagePath: imagePath,
                    width: width,
                    height: height,
                  ),
                ),
              Icon(
                Icons.play_circle_fill,
                size: SdSpacing.s40,
                color: SdColors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
