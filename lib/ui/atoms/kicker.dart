import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class Kicker extends StatelessWidget {
  final String text;
  final Color? color;

  const Kicker({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: WFTextStyles.kicker.copyWith(
        color: color ?? WFColors.purple300.withOpacity(0.8),
      ),
    );
  }
}
