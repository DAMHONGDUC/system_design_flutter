import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';
import 'package:system_design_flutter/resources/sd_spacing.dart';
import 'package:system_design_flutter/utils/sd_log.dart';

class SdSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadiusValue;
  final Widget? customChild;
  final BorderRadiusGeometry? borderRadius;

  const SdSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadiusValue,
    this.customChild,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
      shimmerGradient: LinearGradient(
        colors: [SdColors.grey100, SdColors.grey50, SdColors.grey100],
        stops: const [0.1, 0.5, 0.9],
      ),
      darkShimmerGradient: LinearGradient(
        colors: [SdColors.grey100, SdColors.grey50, SdColors.grey100],
        stops: const [0.1, 0.5, 0.9],
      ),
      child: Skeleton(
        isLoading: true,
        skeleton: SkeletonItem(
          child:
              customChild ??
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: SdColors.grey.withValues(alpha: 0.8),
                  borderRadius:
                      borderRadius ??
                      BorderRadius.circular(borderRadiusValue ?? SdSpacing.s12),
                ),
              ),
        ),
        child: const SizedBox(),
      ),
    );
  }
}
