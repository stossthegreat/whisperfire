import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';
import '../atoms/atoms.dart';

class TopLine extends StatelessWidget {
  final String tabLabel;
  final String profileTag;
  final Widget? rightWidget;

  const TopLine({
    super.key,
    required this.tabLabel,
    required this.profileTag,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: WFDims.topLineFirstSection),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tabLabel,
                  style: WFTextStyles.h3,
                ),
                const SizedBox(height: 4),
                Text(
                  profileTag,
                  style: WFTextStyles.bodySmall.copyWith(
                    color: WFColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          if (rightWidget != null) rightWidget!,
        ],
      ),
    );
  }
} 