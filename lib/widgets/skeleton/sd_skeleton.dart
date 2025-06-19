import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

class SdSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const SdSkeleton({super.key, this.width, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
      shimmerGradient: LinearGradient(
        colors: [SdColors.grey100, SdColors.grey50, SdColors.grey100],
        stops: const [0.1, 0.5, 0.9],
      ),
      child: Skeleton(
        isLoading: true,
        skeleton: SkeletonItem(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: SdColors.grey50,
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
        ),
        child: const SizedBox(),
      ),
    );
  }
}
