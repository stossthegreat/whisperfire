import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class KVRow extends StatelessWidget {
  final String label;
  final String value;
  final EdgeInsetsGeometry? padding;

  const KVRow({
    super.key,
    required this.label,
    required this.value,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: WFTextStyles.bodySmall.copyWith(
                color: WFColors.gray400,
                fontSize: 16, // Bigger text
                fontWeight: FontWeight.w600, // Thicker text
              ),
            ),
          ),
          const SizedBox(width: WFDims.spacingM),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: WFTextStyles.bodySmall.copyWith(
                color: WFColors.textPrimary,
                fontSize: 16, // Bigger text
                fontWeight: FontWeight.w600, // Thicker text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
