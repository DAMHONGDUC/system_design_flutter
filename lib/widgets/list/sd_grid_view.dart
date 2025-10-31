import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SdGridView extends StatelessWidget {
  final ScrollController? controller;
  final List items;
  final IndexedWidgetBuilder itemBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  // Grid settings
  final int gridCrossAxisCount;
  final double gridMainAxisSpacing;
  final double gridCrossAxisSpacing;
  final EdgeInsetsGeometry? padding;

  const SdGridView({
    super.key,
    this.controller,
    required this.items,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.physics,
    this.gridCrossAxisCount = 2,
    this.gridMainAxisSpacing = 0,
    this.gridCrossAxisSpacing = 0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
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

    return shrinkWrap ? grid : Expanded(child: grid);
  }
}
