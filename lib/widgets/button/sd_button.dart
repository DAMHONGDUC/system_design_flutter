import 'package:flutter/material.dart';
import 'package:system_design_flutter/theme/theme.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double? height;

  const SdButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: SdColors.black,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(
            vertical: SdSpacingConstants.spacing12,
            horizontal: SdSpacingConstants.spacing24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SdSpacingConstants.radius100),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: SdTextStyle.bodyMedium().copyWith(color: SdColors.white),
        ),
      ),
    );
  }
}
