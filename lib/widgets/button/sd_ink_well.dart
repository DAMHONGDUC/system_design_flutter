import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdInkWell extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Color? containerBg;
  final bool isFlat;

  const SdInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 100,
    this.padding,
    this.containerBg,
    this.isFlat = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? SdSpacing.s100;
    final defautPadding = padding ?? EdgeInsets.all(SdSpacing.s12);

    return Container(
      decoration: BoxDecoration(
        borderRadius:
            isFlat
                ? null
                : BorderRadius.all(Radius.circular(defaultBorderRadius)),
        color: containerBg,
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
          child: Container(
            padding: isFlat ? null : defautPadding,
            child: child,
          ),
        ),
      ),
    );
  }
}
