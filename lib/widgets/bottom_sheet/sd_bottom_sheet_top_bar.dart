import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/widgets/button/sd_ink_well.dart';
import 'package:system_design_flutter/widgets/misc/sd_divider.dart';
import 'package:system_design_flutter/widgets/spacing/sd_horizontal_spacing.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdBottomSheetTopBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onClose;
  final double closeButtonLeftGap;

  const SdBottomSheetTopBar({
    super.key,
    this.title,
    this.onClose,
    this.closeButtonLeftGap = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SdSpacingConstants.spacing36,
          height: SdSpacingConstants.spacing6,
          decoration: BoxDecoration(
            color: SdColors.grey400,
            borderRadius: BorderRadius.circular(SdSpacingConstants.radius8),
          ),
        ),
        SdVerticalSpacing(value: SdSpacingConstants.spacing6),
        SizedBox(
          height: SdSpacingConstants.spacing32,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: closeButtonLeftGap,
                child: SdInkWell(
                  padding: EdgeInsets.all(SdSpacingConstants.spacing4),
                  onTap: onClose ?? () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, size: SdIconSize.size24),
                ),
              ),
              if (title != null) Text(title!, style: SdTextStyle.heading12()),
            ],
          ),
        ),
        SdDivider(),
      ],
    );
  }
}
