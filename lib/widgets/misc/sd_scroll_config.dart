import 'package:flutter/material.dart';

/// Custom scroll behavior that disables the default overscroll glow effect.
class _SdScrollBehavior extends ScrollBehavior {
  const _SdScrollBehavior();

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }

  // For Flutter 3.6+, override this instead:
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}

/// Widget wrapper to apply no-glow scroll behavior to its child.
class SdScrollConfig extends StatelessWidget {
  final Widget child;

  const SdScrollConfig({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const _SdScrollBehavior(),
      child: child,
    );
  }
}
