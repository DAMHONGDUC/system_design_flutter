import 'package:flutter/material.dart';
import 'package:system_design_flutter/widgets/image/sd_image.dart';

import 'sd_preview_media_config.dart';
import 'sd_preview_media_view.dart';

class ImagePreviewView extends StatelessWidget {
  final SdPreviewMediaConfig config;

  const ImagePreviewView({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    if (config.isAsset) {
      return SdImage(imagePath: config.filePath);
    }
    return SizedBox.shrink();
  }
}
