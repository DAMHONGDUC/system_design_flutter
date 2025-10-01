import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'sd_preview_media_config.dart';
import 'sd_preview_media_view.dart';

class VideoPreviewView extends StatefulWidget {
  final SdPreviewMediaConfig config;

  const VideoPreviewView({super.key, required this.config});

  @override
  State<VideoPreviewView> createState() => _VideoPreviewViewState();
}

class _VideoPreviewViewState extends State<VideoPreviewView> {
  late Future<File> _fileFuture;

  @override
  void initState() {
    super.initState();
    _fileFuture = _loadFile(widget.config);
  }

  Future<File> _loadFile(SdPreviewMediaConfig config) async {
    if (config.isAsset) {
      final byteData = await rootBundle.load(config.filePath);
      final tempFile = File(
        '${Directory.systemTemp.path}/${config.filePath.split('/').last}',
      );
      await tempFile.writeAsBytes(byteData.buffer.asUint8List());
      return tempFile;
    } else {
      return File(config.filePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: _fileFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final file = snapshot.data!;
        return _VideoPlayerWidget(file: file);
      },
    );
  }
}

/// Widget riêng để quản lý VideoPlayerController
class _VideoPlayerWidget extends StatefulWidget {
  final File file;

  const _VideoPlayerWidget({required this.file});

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        IconButton(
          icon: Icon(
            _controller.value.isPlaying
                ? Icons.pause_circle
                : Icons.play_circle,
            size: 60,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
        ),
      ],
    );
  }
}
