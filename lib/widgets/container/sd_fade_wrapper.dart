import 'package:flutter/material.dart';

class SdFadeWrapper extends StatelessWidget {
  final Widget child;
  final double progress; // expected between 0.0 and 1.0
  final Duration duration;

  const SdFadeWrapper({
    super.key,
    required this.child,
    required this.progress,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: progress.clamp(0.0, 1.0),
      duration: duration,
      child: child,
    );
  }
}
