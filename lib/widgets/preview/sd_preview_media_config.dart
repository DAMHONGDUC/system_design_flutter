class SdPreviewMediaConfig {
  final String filePath;
  final bool isVideo;
  final bool isAsset;

  SdPreviewMediaConfig({
    required this.filePath,
    required this.isVideo,
    this.isAsset = false,
  });

  /// Convert JSON to object
  factory SdPreviewMediaConfig.fromJson(Map<String, dynamic> json) {
    return SdPreviewMediaConfig(
      filePath: json['filePath'] as String,
      isVideo: json['isVideo'] as bool,
      isAsset: json['isAsset'] as bool? ?? false,
    );
  }

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'filePath': filePath,
      'isVideo': isVideo,
      'isAsset': isAsset,
    };
  }
}
