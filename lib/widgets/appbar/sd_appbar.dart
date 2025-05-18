import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/widgets/button/sd_ink_well.dart';
import 'package:system_design_flutter/widgets/icon/sd_icon.dart';
import 'package:system_design_flutter/widgets/spacing/sd_vertical_spacing.dart';

class SdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool centerTitle;
  final bool showBackButton;
  final Color? textColor;
  final Color? shadowColor;

  const SdAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.centerTitle = false,
    this.showBackButton = true,
    this.textColor,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final spacingWithEdge = SdSpacingConstants.spacing10;

    return AppBar(
      title: Row(
        children: [
          if (showBackButton)
            Row(
              children: [
                SdInkWell(
                  containerBg: SdColors.grey100,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SdIcon(
                    iconData: Icons.arrow_back_ios_rounded,
                    iconSize: SdIconSize.size16,
                  ),
                ),
                const SdHorizontalSpacing(),
              ],
            ),
          Text(
            title,
            style: SdTextStyle.heading14().copyWith(color: textColor),
          ),
        ],
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.white,
      // disable color change on scroll
      surfaceTintColor: SdColors.transparent,
      actions: actions,
      leading: const SizedBox.shrink(),
      leadingWidth: 0,
      titleSpacing: spacingWithEdge,
      actionsPadding: EdgeInsets.only(right: spacingWithEdge),
      elevation: SdSpacingConstants.spacing1,
      shadowColor: shadowColor ?? SdColors.black54,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
