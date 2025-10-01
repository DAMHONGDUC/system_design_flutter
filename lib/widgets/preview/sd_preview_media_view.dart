import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

import 'sd_preview_media_config.dart';

class SdPreviewMediaView extends StatelessWidget {
  final List<SdPreviewMediaConfig> items;

  const SdPreviewMediaView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final bgColor = SdColors.black;

    return SdSafeAreaScaffold(
      backgroundColor: bgColor,
      contentBgColor: bgColor,
      appBar: AppBar(
        title: Text(
          '5/10',
          style: SdTextStyle.body14().wSemiBold().wColor(SdColors.white),
        ),
        backgroundColor: bgColor,
        foregroundColor: SdColors.white,
      ),
      child: Center(
        child: Container(
          color: bgColor,
          alignment: Alignment.center,
          height: 500,
          child: PageView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];
              return Center(
                child:
                    item.isVideo
                        ? VideoPreviewView(config: item)
                        : ImagePreviewView(config: item),
              );
            },
          ),
        ),
      ),
    );
  }
}
