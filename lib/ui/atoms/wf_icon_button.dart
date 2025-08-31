import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class WFIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final String? tooltip;

  const WFIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.size,
    this.padding,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding ?? const EdgeInsets.all(WFDims.paddingM),
      decoration: BoxDecoration(
        color: backgroundColor ?? WFColors.gray800.withOpacity(0.6),
        borderRadius: BorderRadius.circular(WFDims.radiusMedium),
        border: Border.all(
          color: WFColors.glassBorder,
          width: WFDims.borderThin,
        ),
        boxShadow: onPressed != null ? WFShadows.button : null,
      ),
      child: Icon(
        icon,
        size: size ?? WFDims.iconM,
        color: color ?? WFColors.textSecondary,
      ),
    );

    final tappable = GestureDetector(
      onTap: onPressed,
      child: content,
    );

    return tooltip != null
        ? Tooltip(message: tooltip!, child: tappable)
        : tappable;
  }
}
