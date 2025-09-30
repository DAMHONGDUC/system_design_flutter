import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_design_flutter/model/model.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:system_design_flutter/utils/sd_log.dart';

class SdAssetHelper {
  static Future<AssetVideoMetadata> getVideoMetadataFromAsset({
    required String videoPath,
  }) async {
    final byteData = await rootBundle.load(videoPath);
    Directory tempDir = await getTemporaryDirectory();

    File tempVideoFile =
        File("${tempDir.path}/${videoPath}")
          ..createSync(recursive: true)
          ..writeAsBytesSync(
            byteData.buffer.asUint8List(
              byteData.offsetInBytes,
              byteData.lengthInBytes,
            ),
          );

    final videoThumbnail = await getLocalVideoThumbnail(file: tempVideoFile);
    final videoDuration = await getLocalVideoDuration(file: tempVideoFile);

    return AssetVideoMetadata(
      videoPath: videoPath,
      tempFile: tempVideoFile,
      duration: videoDuration,
      thumbnailPath: videoThumbnail,
    );
  }

  static Future<Duration?> getLocalVideoDuration({required File file}) async {
    final controller = VideoPlayerController.file(file);

    try {
      await controller.initialize(); // loads metadata
      return controller.value.duration;
    } catch (e) {
      print("Error getting video duration: $e");
      return null;
    } finally {
      controller.dispose();
    }
  }

  static Future<String?> getLocalVideoThumbnail({
    required File file,
    int quality = 50,
  }) async {
    try {
      return await VideoThumbnail.thumbnailFile(
        video: file.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        quality: quality,
      );
    } catch (e, st) {
      SdLog.e('Error getVideoThumbnailFromAsset', e);
      SdLog.e('StackTrace', st);
      return null;
    }
  }
}
