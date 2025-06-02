import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdDecorationHelper {
  static textFieldDecoration(
    BuildContext context, {
    Color fillInputDefault = SdColors.white,
    Color borderInputDefault = SdColors.black,
  }) => InputDecoration(
    filled: true,
    fillColor: fillInputDefault,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacing.s12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacing.s12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacing.s12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacing.s12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacing.s12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
  );

  static boxShadow({int ratio = 1, required Color color}) {
    return BoxShadow(
      color: color,
      spreadRadius: (2 * ratio).sp,
      blurRadius: (5 * ratio).sp,
    );
  }
}
