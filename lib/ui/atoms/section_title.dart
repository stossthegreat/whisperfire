import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class SectionTitle extends StatelessWidget {
  final String emoji;
  final String title;
  final EdgeInsetsGeometry? padding;

  const SectionTitle({
    super.key,
    required this.emoji,
    required this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: WFDims.spacingL),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: WFDims.spacingL),
          Text(title, style: WFTextStyles.sectionTitle),
        ],
      ),
    );
  }
} 