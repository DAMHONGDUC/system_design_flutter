import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdInkWell extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final double? borderRadius;
  final Color? containerBg;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Border? border;

  const SdInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 100,
    this.containerBg,
    this.padding,
    this.width,
    this.height,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? SdSpacing.s100;
    final defautPadding = padding ?? EdgeInsets.all(SdSpacing.s12);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        color: containerBg,
        border: border,
      ),
      child: Material(
        color: SdColors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(defaultBorderRadius),
            ),
          ),
          onTap: onTap,
          child: Container(padding: defautPadding, child: child),
        ),
      ),
    );
  }
}
