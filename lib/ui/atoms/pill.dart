import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class Pill extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  const Pill({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: WFDims.paddingM,
            vertical: WFDims.paddingS,
          ),
      decoration: BoxDecoration(
        color: backgroundColor ?? WFColors.purple500.withOpacity(0.2),
        borderRadius: BorderRadius.circular(WFDims.radiusXLarge),
        border: Border.all(
          color: WFColors.purple500.withOpacity(0.3),
          width: WFDims.borderThin,
        ),
      ),
      child: Text(
        text,
        style: WFTextStyles.labelMedium.copyWith(
          color: textColor ?? WFColors.purple300,
          fontSize: 16, // Bigger text
          fontWeight: FontWeight.w600, // Thicker text
        ),
      ),
    );
  }
}
