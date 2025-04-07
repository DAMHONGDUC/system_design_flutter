import 'package:flutter/material.dart';
import 'package:system_design_flutter/theme/theme.dart';

class SdBottomSheetContainer extends StatelessWidget {
  const SdBottomSheetContainer({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SdThemeConstants.spacing12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
