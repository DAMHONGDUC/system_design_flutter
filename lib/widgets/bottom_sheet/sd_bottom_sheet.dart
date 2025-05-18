import 'package:flutter/material.dart';
import 'package:system_design_flutter/widgets/widgets.dart';

class SdBottomSheet extends StatelessWidget {
  const SdBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.bgColor,
    this.textColor,
  });
  final Widget child;
  final String? title;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SdBottomSheetTopBar(title: title, textColor: textColor),
          SdVerticalSpacing(),
          child,
          SdVerticalSpacing(),
        ],
      ),
    );
  }
}
