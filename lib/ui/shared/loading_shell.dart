import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class LoadingShell extends StatelessWidget {
  final String? message;

  const LoadingShell({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(WFColors.purple400),
          ),
          const SizedBox(height: WFDims.spacingL),
          Text(
            message ?? 'Loading...',
            style: const TextStyle(
              color: WFColors.textTertiary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
