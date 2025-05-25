import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_spacing_constants.dart';
import 'package:system_design_flutter/widgets/widgets.dart';

class SdBottomSheet extends StatelessWidget {
  const SdBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.bgColor,
    this.textColor,
    this.borderRadius,
  });
  final Widget child;
  final String? title;
  final Color? bgColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SdBottomSheetTopBar(title: title, textColor: textColor),
          if (title != null) SdVerticalSpacing(),
          child,
          SdVerticalSpacing(),
        ],
      ),
    );
  }
}
