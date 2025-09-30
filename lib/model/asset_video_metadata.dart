import 'dart:io';
import 'package:equatable/equatable.dart';

class AssetVideoMetadata extends Equatable {
  final File? tempFile;
  final Duration? duration;
  final String videoPath;
  final String? thumbnailPath;

  const AssetVideoMetadata({
    this.tempFile,
    this.duration,
    required this.videoPath,
    this.thumbnailPath,
  });

  factory AssetVideoMetadata.init(String videoPath) {
    return AssetVideoMetadata(
      tempFile: null,
      duration: null,
      videoPath: videoPath,
      thumbnailPath: null,
    );
  }

  AssetVideoMetadata copyWith({
    File? tempFile,
    Duration? duration,
    String? videoPath,
    String? thumbnailPath,
  }) {
    return AssetVideoMetadata(
      tempFile: tempFile ?? this.tempFile,
      duration: duration ?? this.duration,
      videoPath: videoPath ?? this.videoPath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }

  @override
  List<Object?> get props => [tempFile, duration, videoPath, thumbnailPath];
}
