import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:system_design_flutter/index.dart';

class SdHelper {
  static void showSelectBottomSheet<T>({
    required BuildContext context,
    required List<T> data,
    required String Function(T data) itemLabelBuilder,
    String? title,
    void Function(T selected)? onSelected,
    Color? bgColor,
    Color? textColor,
  }) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(SdSpacing.s10),
      topRight: Radius.circular(SdSpacing.s10),
    );

    showMoonModalBottomSheet(
      context: context,
      borderRadius: borderRadius,
      builder: (context) {
        return SdBottomSheet(
          title: title,
          bgColor: bgColor,
          textColor: textColor,
          borderRadius: borderRadius,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = data[index];

              return SdInkWell(
                borderRadius: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: SdSpacing.s16,
                  vertical: SdSpacing.s12,
                ),
                onTap: () {
                  onSelected?.call(item);
                  Navigator.of(context).pop();
                },
                child: Text(
                  itemLabelBuilder(item),
                  style: SdTextStyle.body12().copyWith(color: textColor),
                ),
              );
            },
            itemCount: data.length,
          ),
        );
      },
    );
  }

  static Future delay({int milliseconds = 500, void Function()? action}) async {
    await Future.delayed(Duration(milliseconds: milliseconds), action);
  }

  static Future<void> delayLoading() async {
    final random = Random();
    final milliseconds = 1000 + random.nextInt(2000);
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

  static bool isAmountOverLimit(String value, {int? limit}) {
    final cleaned = value.replaceAll(',', '');
    final numValue = double.tryParse(cleaned) ?? 0;

    return numValue > (limit ?? SdConstants.limitAmount);
  }
}
