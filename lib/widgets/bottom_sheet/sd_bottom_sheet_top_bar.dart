import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/widgets/button/sd_ink_well.dart';
import 'package:system_design_flutter/widgets/misc/sd_divider.dart';
import 'package:system_design_flutter/widgets/spacing/sd_horizontal_spacing.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdBottomSheetTopBar extends StatelessWidget {
  final String? title;

  const SdBottomSheetTopBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SdVerticalSpacing(),
        Container(
          width: SdSpacingConstants.spacing36,
          height: SdSpacingConstants.spacing6,
          decoration: BoxDecoration(
            color: SdColors.grey400,
            borderRadius: BorderRadius.circular(SdSpacingConstants.radius8),
          ),
        ),
        SdVerticalSpacing(),
        if (title != null)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SdSpacingConstants.spacing16,
              ),
              child: Text(title!, style: SdTextStyle.heading14()),
            ),
          ),
        SdVerticalSpacing(),
      ],
    );
  }
}
