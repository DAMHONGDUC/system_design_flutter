import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/theme/custom_theme.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

abstract class BaseTextStyle {
  static TextStyle base({
    double fontSize = 10,
    FontWeight fontWeight = FontWeight.w400,
    Color color = SdColors.black,
  }) {
    return TextStyle(
      fontFamily: SdConstants.sdFontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

class SdTextStyle extends BaseTextStyle {
  SdTextStyle._();

  // Titles
  static TextStyle titleSmall() => BaseTextStyle.base(fontSize: 12.sp);
  static TextStyle titleMedium() =>
      BaseTextStyle.base(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle titleLarge() =>
      BaseTextStyle.base(fontSize: 16.sp, fontWeight: FontWeight.w600);

  // Body
  static TextStyle bodySmall() => BaseTextStyle.base(fontSize: 12.sp);
  static TextStyle bodyMedium() => BaseTextStyle.base(fontSize: 14.sp);
  static TextStyle bodyLarge() =>
      BaseTextStyle.base(fontSize: 16.sp, fontWeight: FontWeight.w500);

  // Headings
  static TextStyle headingSmall() =>
      BaseTextStyle.base(fontSize: 18.sp, fontWeight: FontWeight.w600);
  static TextStyle headingMedium() =>
      BaseTextStyle.base(fontSize: 20.sp, fontWeight: FontWeight.w700);
  static TextStyle headingLarge() =>
      BaseTextStyle.base(fontSize: 24.sp, fontWeight: FontWeight.w900);

  // Captions & Labels
  static TextStyle caption() =>
      BaseTextStyle.base(fontSize: 10.sp, fontWeight: FontWeight.w300);
  static TextStyle label() =>
      BaseTextStyle.base(fontSize: 12.sp, fontWeight: FontWeight.w500);
}

extension TextStyleExt on TextStyle {
  TextStyle wLight() => copyWith(fontWeight: FontWeight.w300);
  TextStyle wRegular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle wMedium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle wSemiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle wBold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle size(double fontSize) => copyWith(fontSize: fontSize);
  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
}
