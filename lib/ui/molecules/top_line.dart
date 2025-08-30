import 'package:flutter/material.dart';
import '../../core/theme/text_styles.dart';

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
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tabLabel,
                  style: WFTextStyles.h3.copyWith(
                    fontSize: 26, // Bigger text
                    fontWeight: FontWeight.w800, // Thicker text
                    color: Colors.black, // Black text for analyze page
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  profileTag,
                  style: WFTextStyles.bodySmall.copyWith(
                    color: Colors.black, // Black text for analyze page
                    fontSize: 16, // Bigger text
                    fontWeight: FontWeight.w600, // Thicker text
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
