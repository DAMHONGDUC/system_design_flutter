import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';

abstract class SdBaseTextStyle {
  static TextStyle base({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 10,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? SdColors.black,
    );
  }
}

class SdTextStyle extends SdBaseTextStyle {
  SdTextStyle._();

  // Body styles (regular weight)
  static TextStyle body6() => SdBaseTextStyle.base().wSize(6);
  static TextStyle body8() => SdBaseTextStyle.base().wSize(8);
  static TextStyle body9() => SdBaseTextStyle.base().wSize(9);
  static TextStyle body10() => SdBaseTextStyle.base().wSize(10);
  static TextStyle body12() => SdBaseTextStyle.base().wSize(12);
  static TextStyle body14() => SdBaseTextStyle.base().wSize(14);
  static TextStyle body16() => SdBaseTextStyle.base().wSize(16);
  static TextStyle body18() => SdBaseTextStyle.base().wSize(18);
  static TextStyle body20() => SdBaseTextStyle.base().wSize(20);
  static TextStyle body24() => SdBaseTextStyle.base().wSize(24);
  static TextStyle body32() => SdBaseTextStyle.base().wSize(32);
  static TextStyle body40() => SdBaseTextStyle.base().wSize(40);
  static TextStyle body48() => SdBaseTextStyle.base().wSize(48);
  static TextStyle body56() => SdBaseTextStyle.base().wSize(56);
  static TextStyle body64() => SdBaseTextStyle.base().wSize(64);
  static TextStyle body72() => SdBaseTextStyle.base().wSize(72);

  // Heading styles (semi-bold)
  static TextStyle heading6() => SdBaseTextStyle.base().wSemiBold().wSize(6);
  static TextStyle heading8() => SdBaseTextStyle.base().wSemiBold().wSize(8);
  static TextStyle heading9() => SdBaseTextStyle.base().wSemiBold().wSize(9);
  static TextStyle heading10() => SdBaseTextStyle.base().wSemiBold().wSize(10);
  static TextStyle heading12() => SdBaseTextStyle.base().wSemiBold().wSize(12);
  static TextStyle heading13() => SdBaseTextStyle.base().wSemiBold().wSize(13);
  static TextStyle heading14() => SdBaseTextStyle.base().wSemiBold().wSize(14);
  static TextStyle heading16() => SdBaseTextStyle.base().wSemiBold().wSize(16);
  static TextStyle heading18() => SdBaseTextStyle.base().wSemiBold().wSize(18);
  static TextStyle heading20() => SdBaseTextStyle.base().wSemiBold().wSize(20);
  static TextStyle heading24() => SdBaseTextStyle.base().wSemiBold().wSize(24);
  static TextStyle heading28() => SdBaseTextStyle.base().wSemiBold().wSize(28);
  static TextStyle heading32() => SdBaseTextStyle.base().wSemiBold().wSize(32);
  static TextStyle heading40() => SdBaseTextStyle.base().wSemiBold().wSize(40);
  static TextStyle heading48() => SdBaseTextStyle.base().wSemiBold().wSize(48);
  static TextStyle heading56() => SdBaseTextStyle.base().wSemiBold().wSize(56);
  static TextStyle heading64() => SdBaseTextStyle.base().wSemiBold().wSize(64);
  static TextStyle heading72() => SdBaseTextStyle.base().wSemiBold().wSize(72);
}

extension TextStyleExt on TextStyle {
  TextStyle wLight() => copyWith(fontWeight: FontWeight.w300);
  TextStyle wRegular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle wMedium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle wSemiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle wBold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle wColor(Color color) => copyWith(color: color);
  TextStyle wSize(double fontSize) => copyWith(fontSize: fontSize);
  TextStyle wFontFamily(String fontFamily) => copyWith(fontFamily: fontFamily);
  TextStyle wItalic() => copyWith(fontStyle: FontStyle.italic);
  TextStyle whiteText() => copyWith(color: SdColors.white);
}
