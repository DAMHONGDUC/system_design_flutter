import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:system_design_flutter/index.dart';
import 'package:system_design_flutter/model/asset_video_metadata.dart';

class SdVideoPlaceHolder extends StatelessWidget {
  final String videoPath;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isAsset;

  const SdVideoPlaceHolder({
    super.key,
    required this.videoPath,
    this.width = 80.0,
    this.height = 80.0,
    this.fit = BoxFit.cover,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AssetVideoMetadata>(
      future: SdAssetHelper.getVideoMetadataFromAsset(videoPath: videoPath),
      builder: (context, snapshot) {
        final assetVideoMetadata = snapshot.data;

        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: SdColors.grey,
            borderRadius: BorderRadius.circular(SdSpacing.s8),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (assetVideoMetadata?.thumbnailPath != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(SdSpacing.s8),
                  child: SdImage(
                    imagePath: assetVideoMetadata!.thumbnailPath!,
                    width: width,
                    height: height,
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                  color: SdColors.black.withAlpha(100),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(SdSpacing.s8),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: SdSpacing.s4),
                width: double.infinity,
                height: SdSpacing.s24,
                child: Row(
                  children: [
                    SdIcon(
                      iconData: Ionicons.videocam_outline,
                      iconSize: SdSpacing.s18,
                      color: SdColors.white,
                    ),
                    Spacer(),
                    Text(
                      SdDateTimeHelper.formatDuration(
                        assetVideoMetadata?.duration,
                      ),
                      style: SdTextStyle.body12().wColor(SdColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
