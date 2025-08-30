import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class WFPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Gradient? gradient;

  const WFPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? WFDims.buttonHeight,
      decoration: BoxDecoration(
        gradient: gradient ?? WFGradients.purpleGradient,
        borderRadius: BorderRadius.circular(WFDims.radiusMedium),
        boxShadow: onPressed != null ? WFShadows.button : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: WFDims.paddingXL,
                  vertical: WFDims.paddingM,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading) ...[
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(WFColors.textPrimary),
                    ),
                  ),
                  const SizedBox(width: WFDims.spacingS),
                ] else if (icon != null) ...[
                  Icon(icon, size: WFDims.iconS, color: WFColors.textPrimary),
                  const SizedBox(width: WFDims.spacingS),
                ],
                Text(
                  text,
                  style: textStyle ?? WFTextStyles.button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
