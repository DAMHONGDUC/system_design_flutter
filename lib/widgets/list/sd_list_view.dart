import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:system_design_flutter/resources/sd_spacing.dart';
import 'package:system_design_flutter/widgets/widgets.dart';

enum SdListViewType { list, masonryGrid }

class SdListView extends StatelessWidget {
  final ScrollController? controller;
  final List items;
  final bool canLoadMore;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final SdListViewType viewType;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  // grid => use for masonry grid
  final int gridCrossAxisCount;
  final double gridMainAxisSpacing;
  final double gridCrossAxisSpacing;
  final EdgeInsetsGeometry? padding;

  const SdListView({
    super.key,
    this.controller,
    required this.items,
    this.canLoadMore = false,
    required this.itemBuilder,
    this.separatorBuilder,
    this.viewType = SdListViewType.list,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.physics,
    this.gridCrossAxisCount = 2,
    this.gridMainAxisSpacing = 0,
    this.gridCrossAxisSpacing = 0,
    this.padding,
  });

  Widget _buildLoading() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SdSpacing.s16),
      child: Center(
        child: SizedBox(
          width: SdSpacing.s28,
          height: SdSpacing.s28,
          child: CircularProgressIndicator(strokeWidth: 3),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (viewType == SdListViewType.masonryGrid) {
      final grid = MasonryGridView.count(
        controller: controller,
        padding: padding,
        crossAxisCount: gridCrossAxisCount,
        mainAxisSpacing: gridMainAxisSpacing,
        crossAxisSpacing: gridCrossAxisSpacing,
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemCount: items.length,
        itemBuilder: (context, index) => itemBuilder(context, index),
      );

      return Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: [
          shrinkWrap ? grid : Expanded(child: grid),
          SdVerticalSpacing(),
          if (canLoadMore) _buildLoading(),
        ],
      );
    }

    // Default: ListView.separated
    return ListView.separated(
      controller: controller,
      padding: padding,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: items.length + (canLoadMore ? 1 : 0),
      separatorBuilder:
          separatorBuilder ?? (context, index) => SizedBox.shrink(),
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return _buildLoading();
        }
        return itemBuilder(context, index);
      },
    );
  }
}
