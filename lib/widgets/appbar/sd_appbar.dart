import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/widgets/button/sd_ink_well.dart';
import 'package:system_design_flutter/widgets/icon/sd_icon.dart';
import 'package:system_design_flutter/widgets/spacing/sd_vertical_spacing.dart';

class SdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool centerTitle;
  final bool showBackButton;
  final Color? textColor;
  final Color? shadowColor;
  final Color? backButtonContainerBg;
  final Color? backButtonIconColor;
  final Widget? titleWidget;

  const SdAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.centerTitle = false,
    this.showBackButton = true,
    this.textColor,
    this.shadowColor,
    this.backButtonContainerBg,
    this.backButtonIconColor,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    final spacingWithEdge = SdSpacingConstants.spacing10;

    return AppBar(
      title:
          titleWidget ??
          (title != null
              ? Text(
                title!,
                style: SdTextStyle.heading14().copyWith(color: textColor),
              )
              : null),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.white,
      // disable color change on scroll
      surfaceTintColor: SdColors.transparent,
      actions: actions,
      leading:
          showBackButton
              ? SdInkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SdIcon(
                  iconData:
                      Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios_rounded,
                  iconSize: SdIconSize.size20,
                  color: backButtonIconColor,
                ),
              )
              : null,
      titleSpacing: spacingWithEdge,
      actionsPadding: EdgeInsets.only(right: spacingWithEdge),
      elevation: SdSpacingConstants.spacing1,
      shadowColor: shadowColor ?? SdColors.black54,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
