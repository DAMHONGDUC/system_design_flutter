import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SdIconButton extends StatelessWidget {
  const SdIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.padding,
  });

  final void Function()? onPressed;
  final Widget icon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final finalPadding = padding ?? EdgeInsets.all(SdSpacing.s6);

    return SdInkWell(padding: finalPadding, onTap: onPressed, child: icon);
  }
}
