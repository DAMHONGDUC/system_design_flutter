import 'package:flutter/material.dart';

class SdKeyboardDismisser extends StatelessWidget {
  final Widget child;

  const SdKeyboardDismisser({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
