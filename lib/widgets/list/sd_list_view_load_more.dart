import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/sd_spacing.dart';

class SdListViewLoadMore extends StatefulWidget {
  final ScrollController? controller;
  final List items;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool canLoadMore;
  final VoidCallback? onLoadMore;

  const SdListViewLoadMore({
    super.key,
    this.controller,
    required this.items,
    required this.itemBuilder,
    this.separatorBuilder,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
    this.canLoadMore = false,
    this.onLoadMore,
  });

  @override
  State<SdListViewLoadMore> createState() => _SdListViewLoadMoreState();
}

class _SdListViewLoadMoreState extends State<SdListViewLoadMore> {
  late final ScrollController _controller;
  bool _isLoadingTriggered = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ScrollController();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.onLoadMore == null || !widget.canLoadMore) return;

    final position = _controller.position;
    if (position.pixels >= position.maxScrollExtent - 100 &&
        !_isLoadingTriggered) {
      _isLoadingTriggered = true;
      widget.onLoadMore?.call();
    }
  }

  @override
  void didUpdateWidget(covariant SdListViewLoadMore oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset trigger when load more finished
    if (oldWidget.canLoadMore && !widget.canLoadMore) {
      _isLoadingTriggered = false;
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onScroll);
    }
    super.dispose();
  }

  Widget _buildLoading() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SdSpacing.s16),
      child: const Center(
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
    return ListView.separated(
      controller: _controller,
      padding: widget.padding,
      scrollDirection: widget.scrollDirection,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics,
      itemCount: widget.items.length + (widget.canLoadMore ? 1 : 0),
      separatorBuilder:
          widget.separatorBuilder ?? (_, __) => const SizedBox.shrink(),
      itemBuilder: (context, index) {
        if (index >= widget.items.length) {
          return _buildLoading();
        }
        return widget.itemBuilder(context, index);
      },
    );
  }
}
