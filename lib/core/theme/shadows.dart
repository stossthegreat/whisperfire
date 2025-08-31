import 'package:flutter/material.dart';

class WFShadows {
  // Glass effect shadows
  static const List<BoxShadow> glass = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 18,
      offset: Offset(0, 4),
    ),
  ];

  // Button shadows
  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  // Purple glow for special elements
  static const List<BoxShadow> purpleGlow = [
    BoxShadow(
      color: Color(0x40A855FF),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  // Card shadows
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  // Subtle shadows
  static const List<BoxShadow> subtle = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];
}
