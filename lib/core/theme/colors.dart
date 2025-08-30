import 'package:flutter/material.dart';

class WFColors {
  // Base: #0B0F14 (near-black)
  static const Color base = Color(0xFF0B0F14);

  // Glass panels: white 28–36% opacity
  static const Color glassLight = Color(0x47FFFFFF); // 28% white
  static const Color glassMedium = Color(0x5CFFFFFF); // 36% white

  // Border: rgba(168,85,255,0.35)
  static const Color glassBorder = Color(0x59A855FF);

  // Gradients
  static const List<Color> tealPurple = [
    Color(0xFF14B8A6), // teal-500
    Color(0xFF8B5CF6), // purple-500
  ];

  static const List<Color> redPink = [
    Color(0xFFEF4444), // red-500
    Color(0xFFEC4899), // pink-500
  ];

  // Purple variants
  static const Color purple300 = Color(0xFFC4B5FD);
  static const Color purple400 = Color(0xFFA78BFA);
  static const Color purple500 = Color(0xFF8B5CF6);
  static const Color purple600 = Color(0xFF7C3AED);

  // Gray variants
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF); // white (was near-black)
  static const Color textSecondary =
      Color(0xFFE5E7EB); // gray-200 (was gray-700)
  static const Color textTertiary =
      Color(0xFF9CA3AF); // gray-400 (was gray-500)
  static const Color textMuted = Color(0xFF6B7280); // gray-500 (was gray-400)

  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}
