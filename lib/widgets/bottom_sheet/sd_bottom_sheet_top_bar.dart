import 'package:flutter/material.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/widgets/button/sd_ink_well.dart';
import 'package:system_design_flutter/widgets/spacing/sd_horizontal_spacing.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdBottomSheetTopBar extends StatelessWidget {
  final String? title;
  final VoidCallback? onClose;

  const SdBottomSheetTopBar({super.key, this.title, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SdSpacingConstants.spacing40,
          height: SdSpacingConstants.spacing6,
          decoration: BoxDecoration(
            color: SdColors.grey,
            borderRadius: BorderRadius.circular(SdSpacingConstants.radius8),
          ),
        ),
        SdVerticalSpacing(value: SdSpacingConstants.spacing4),
        SizedBox(
          height: SdSpacingConstants.spacing32,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                child: SdInkWell(
                  padding: EdgeInsets.all(SdSpacingConstants.spacing4),
                  onTap: onClose ?? () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, size: SdIconSize.size24),
                ),
              ),
              if (title != null) Text(title!, style: SdTextStyle.bodyLarge()),
            ],
          ),
        ),
      ],
    );
  }
}
