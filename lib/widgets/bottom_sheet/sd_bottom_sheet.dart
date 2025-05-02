import 'package:flutter/material.dart';
import 'package:system_design_flutter/widgets/widgets.dart';

class SdBottomSheet extends StatelessWidget {
  const SdBottomSheet({super.key, required this.child, this.title});
  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SdBottomSheetTopBar(title: title),
          SdVerticalSpacing(),
          child,
          SdVerticalSpacing(),
        ],
      ),
    );
  }
}
