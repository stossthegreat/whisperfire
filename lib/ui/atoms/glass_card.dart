import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(WFDims.glassCardPadding),
      decoration: BoxDecoration(
        // Glass panels: white 28–36% opacity + blur(18) + 1px border rgba(168,85,255,0.35)
        color: WFColors.glassMedium,
        borderRadius: borderRadius ?? BorderRadius.circular(WFDims.radiusLarge),
        border: Border.all(
          color: WFColors.glassBorder,
          width: WFDims.borderThin,
        ),
        boxShadow: boxShadow ?? WFShadows.glass,
      ),
      child: child,
    );
  }
}
