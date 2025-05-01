import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/widgets/button/sd_ink_well.dart';
import 'package:system_design_flutter/widgets/spacing/sd_vertical_spacing.dart';

class SdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool centerTitle;

  const SdAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final spacingWithEdge = SdSpacingConstants.spacing10;

    return AppBar(
      title: Row(
        children: [
          SdInkWell(
            containerBg: const Color(0xFFECF0F4),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: const Color(0xFF181C2E),
              size: SdIconSize.size16,
            ),
          ),
          const SdHorizontalSpacing(),
          Text(title, style: SdTextStyle.heading14()),
        ],
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      // disable color change on scroll
      surfaceTintColor: SdColors.transparent,
      actions: actions,
      leading: const SizedBox.shrink(),
      leadingWidth: 0,
      titleSpacing: spacingWithEdge,
      actionsPadding: EdgeInsets.only(right: spacingWithEdge),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
