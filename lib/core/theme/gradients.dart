import 'package:flutter/material.dart';
import 'colors.dart';

class WFGradients {
  static const LinearGradient tealPurple = LinearGradient(
    colors: WFColors.tealPurple,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient redPink = LinearGradient(
    colors: WFColors.redPink,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Color(0xFF7C3AED), // purple-600
      Color(0xFF8B5CF6), // purple-500
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
