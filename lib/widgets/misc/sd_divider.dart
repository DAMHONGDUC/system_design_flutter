import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

class SdDivider extends StatelessWidget {
  const SdDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: SdColors.grey400);
  }
}
