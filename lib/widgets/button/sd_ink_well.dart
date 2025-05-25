import 'package:flutter/material.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdInkWell extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Color? containerBg;

  const SdInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 100,
    this.padding,
    this.containerBg,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = borderRadius ?? SdSpacingConstants.spacing12;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
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
            padding: padding ?? EdgeInsets.all(SdSpacingConstants.spacing10),
            child: child,
          ),
        ),
      ),
    );
  }
}
