import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/theme.dart';

class CopyLine extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CopyLine({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: style ?? WFTextStyles.bodyMedium,
          ),
        ),
        const SizedBox(width: WFDims.spacingS),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: text));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Copied to clipboard', style: WFTextStyles.bodySmall),
                backgroundColor: WFColors.purple600,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: Icon(
            Icons.copy,
            size: WFDims.iconS,
            color: WFColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
