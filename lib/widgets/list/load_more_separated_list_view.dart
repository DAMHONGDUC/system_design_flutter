import 'package:flutter/material.dart';

class LoadMoreSeparatedListView extends StatelessWidget {
  final ScrollController? controller;
  final List items;
  final bool isLoadingMore;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;

  const LoadMoreSeparatedListView({
    super.key,
    this.controller,
    required this.items,
    required this.isLoadingMore,
    required this.itemBuilder,
    this.separatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemCount: items.length + (isLoadingMore ? 1 : 0),
      separatorBuilder:
          separatorBuilder ?? (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return itemBuilder(context, index);
      },
    );
  }
}
