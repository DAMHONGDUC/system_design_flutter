import 'package:flutter/material.dart';
import 'package:system_design_flutter/widgets/spacing/sd_horizontal_spacing.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdBottomSheetTopBar extends StatelessWidget {
  final String? title;
  final Color? textColor;
  const SdBottomSheetTopBar({super.key, this.title, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SdVerticalSpacing(),
        Container(
          width: SdSpacing.s36,
          height: SdSpacing.s5,
          decoration: BoxDecoration(
            color: SdColors.grey400,
            borderRadius: BorderRadius.circular(SdSpacing.s8),
          ),
        ),
        SdVerticalSpacing(),
        if (title != null)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SdSpacing.s16),
              child: Text(
                title!,
                style: SdTextStyle.heading14().copyWith(color: textColor),
              ),
            ),
          ),
      ],
    );
  }
}
