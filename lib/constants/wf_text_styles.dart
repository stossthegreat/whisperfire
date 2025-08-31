import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wf_colors.dart';

class WFTextStyles {
  // Typography: Inter (UI), Space Grotesk (headers), JetBrains Mono (code-ish)

  // Headers (Space Grotesk)
  static TextStyle get h1 => GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: WFColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get h2 => GoogleFonts.spaceGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: WFColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h3 => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: WFColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h4 => GoogleFonts.spaceGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: WFColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get h5 => GoogleFonts.spaceGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: WFColors.textPrimary,
        height: 1.4,
      );

  // Body text (Inter)
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: WFColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: WFColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: WFColors.textSecondary,
        height: 1.4,
      );

  // Labels and UI text
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: WFColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: WFColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: WFColors.textTertiary,
        height: 1.3,
      );

  // Kicker (10sp, uppercase, 0.2em spacing, purple-300/80)
  static TextStyle get kicker => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: WFColors.purple300.withOpacity(0.8),
        letterSpacing: 0.2,
        height: 1.2,
      );

  // Section titles (13sp, semibold, gray-200)
  static TextStyle get sectionTitle => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: WFColors.gray200,
        height: 1.3,
      );

  // Code-ish text (JetBrains Mono)
  static TextStyle get code => GoogleFonts.jetBrainsMono(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: WFColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get codeSmall => GoogleFonts.jetBrainsMono(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: WFColors.textTertiary,
        height: 1.3,
      );

  // Button text
  static TextStyle get button => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: WFColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get buttonSmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: WFColors.textPrimary,
        height: 1.2,
      );
}
