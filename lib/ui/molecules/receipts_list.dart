import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class ReceiptsList extends StatelessWidget {
  final List<String> receipts;
  final String mode; // 'scan' or 'pattern'

  const ReceiptsList({
    super.key,
    required this.receipts,
    required this.mode,
  });

  @override
  Widget build(BuildContext context) {
    // Scan: exactly 2; Pattern: 3-4 ordered
    final displayReceipts =
        mode == 'scan' ? receipts.take(2).toList() : receipts.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: displayReceipts.asMap().entries.map((entry) {
        final index = entry.key;
        final receipt = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: index < displayReceipts.length - 1 ? WFDims.spacingS : 0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.only(
                  top: 8,
                  right: WFDims.spacingM,
                ),
                decoration: BoxDecoration(
                  color: WFColors.purple400,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Expanded(
                child: Text(
                  receipt,
                  style: WFTextStyles.bodyMedium.copyWith(
                    color: Colors.black, // Black text for analyze page
                    fontSize: 18, // Bigger text
                    fontWeight: FontWeight.w600, // Thicker text
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
