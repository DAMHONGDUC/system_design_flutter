import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:system_design_flutter/utils/sd_log.dart';

class SdAssetHelper {
  static Future<String?> getVideoThumbnailFromAsset({
    required String videoPath,
    int maxWidth = 80,
    int quality = 50,
  }) async {
    try {
      final byteData = await rootBundle.load(videoPath);
      Directory tempDir = await getTemporaryDirectory();

      File tempVideo =
          File("${tempDir.path}/${videoPath}")
            ..createSync(recursive: true)
            ..writeAsBytesSync(
              byteData.buffer.asUint8List(
                byteData.offsetInBytes,
                byteData.lengthInBytes,
              ),
            );

      return await VideoThumbnail.thumbnailFile(
        video: tempVideo.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );
    } catch (e, st) {
      SdLog.e('Error getVideoThumbnailFromAsset', e);
      SdLog.e('StackTrace', st);
      return null;
    }
  }
}
