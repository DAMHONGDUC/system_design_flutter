import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
import 'package:system_design_flutter/index.dart';

class SdHelper {
  static void showSelectBottomSheet<T>({
    required BuildContext context,
    required List<T> data,
    required String Function(T data) itemLabelBuilder,
    String title = 'Select Item',
    void Function(T selected)? onSelected,
  }) {
    showMoonModalBottomSheet(
      context: context,
      builder: (context) {
        return SdBottomSheet(
          title: title,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = data[index];

              return SdInkWell(
                isButton: false,
                padding: EdgeInsets.symmetric(
                  horizontal: SdSpacingConstants.spacing16,
                  vertical: SdSpacingConstants.spacing12,
                ),
                onTap: () {
                  onSelected?.call(item);
                  Navigator.of(context).pop();
                },
                child: Text(
                  itemLabelBuilder(item),
                  style: SdTextStyle.body12(),
                ),
              );
            },
            itemCount: data.length,
          ),
        );
      },
    );
  }

  static Future delay({int milliseconds = 500}) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }
}
