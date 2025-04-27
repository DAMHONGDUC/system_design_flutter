import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SdHelper {
  static void showBottomSheetDropDown({
    required BuildContext context,
    required TextEditingController controller,
    required List<SelectedListItem<String>> data,
    String title = 'Select Item',
    void Function(String selected)? onSelected,
    double initialChildSize = 0.7,
  }) {
    DropDownState<String>(
      dropDown: DropDown<String>(
        isSearchVisible: false,
        data: data,
        onSelected: (selectedItems) {
          if (selectedItems.isNotEmpty) {
            final selectedValue = selectedItems.first.data;
            controller.text = selectedValue;
            onSelected?.call(selectedValue);
          }
        },
        dropDownHeaderPadding: EdgeInsets.zero,
        listViewSeparatorWidget: SizedBox.shrink(),
        listItemBuilder: (index, dataItem) {
          return Text(dataItem.data, style: SdTextStyle.body12());
        },
        listTileContentPadding: EdgeInsets.symmetric(
          horizontal: SdSpacingConstants.spacing16,
        ),
        dropDownBackgroundColor: SdColors.white,
        bottomSheetTitle: SdBottomSheetTopBar(title: title),
        initialChildSize: initialChildSize,
        minChildSize: 0.3,
        maxChildSize: 0.9,
      ),
    ).showModal(context);
  }
}
