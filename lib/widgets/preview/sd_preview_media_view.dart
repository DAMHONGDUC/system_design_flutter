import 'package:flutter/material.dart';
import 'package:system_design_flutter/index.dart';

class SdPreviewMediaView extends StatefulWidget {
  final List<SdPreviewMediaConfig> items;
  final int initialIndex;

  const SdPreviewMediaView({
    super.key,
    required this.items,
    this.initialIndex = 0,
  });

  static show({
    required BuildContext context,
    required List<SdPreviewMediaConfig> items,
    int initialIndex = 0,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SdPreviewMediaView(items: items, initialIndex: initialIndex);
      },
    );
  }

  @override
  State<SdPreviewMediaView> createState() => _SdPreviewMediaViewState();
}

class _SdPreviewMediaViewState extends State<SdPreviewMediaView> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = SdColors.black;

    return SdAdaptiveStatusBar(
      backgroundColor: bgColor,
      child: Container(
        color: bgColor,
        padding: EdgeInsets.only(
          top: kToolbarHeight,
          bottom: kBottomNavigationBarHeight,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).maybePop();
                    },
                    icon: SdIcon(iconData: Icons.close, color: SdColors.white),
                  ),
                ),
                Text(
                  '${_currentIndex + 1}/${widget.items.length}',
                  style: SdTextStyle.body14().wSemiBold().wColor(
                    SdColors.white,
                  ),
                ),
              ],
            ),
            SdVerticalSpacing(xRatio: 2),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.items.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  final item = widget.items[index];
                  return Center(
                    child:
                        item.isVideo
                            ? SdVideoPreviewView(config: item)
                            : SdImagePreviewView(config: item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
