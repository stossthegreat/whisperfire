import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class DividerFaint extends StatelessWidget {
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  const DividerFaint({
    super.key,
    this.height,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? WFDims.borderThin,
      margin: margin ?? const EdgeInsets.symmetric(vertical: WFDims.spacingM),
      decoration: BoxDecoration(
        color: color ?? WFColors.gray700.withOpacity(0.4),
        borderRadius: BorderRadius.circular(0.5),
      ),
    );
  }
}
