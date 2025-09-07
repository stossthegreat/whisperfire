import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class WFTextStyles {
  // Typography: Inter (UI), Space Grotesk (headers), JetBrains Mono (code-ish)
  // Enhanced with fallback fonts for full Unicode support

  // Helper method to create fonts with fallbacks for full Unicode support
  static TextStyle _createFontWithFallbacks({
    required TextStyle primaryFont,
    required List<String> fallbackFonts,
  }) {
    return primaryFont.copyWith(
      fontFamilyFallback: fallbackFonts,
    );
  }

  // Headers (Space Grotesk with fallbacks)
  static TextStyle get h1 => _createFontWithFallbacks(
        primaryFont: GoogleFonts.spaceGrotesk(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: WFColors.textPrimary,
          height: 1.2,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get h2 => _createFontWithFallbacks(
        primaryFont: GoogleFonts.spaceGrotesk(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: WFColors.textPrimary,
          height: 1.3,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get h3 => _createFontWithFallbacks(
        primaryFont: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: WFColors.textPrimary,
          height: 1.3,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get h4 => _createFontWithFallbacks(
        primaryFont: GoogleFonts.spaceGrotesk(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: WFColors.textPrimary,
          height: 1.4,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get h5 => _createFontWithFallbacks(
        primaryFont: GoogleFonts.spaceGrotesk(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: WFColors.textPrimary,
          height: 1.4,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  // Body text (Inter with fallbacks) - Enhanced for mentor responses
  static TextStyle get bodyLarge => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: WFColors.textPrimary,
          height: 1.5,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get bodyMedium => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: WFColors.textPrimary,
          height: 1.5,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get bodySmall => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: WFColors.textSecondary,
          height: 1.4,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  // Labels and UI text
  static TextStyle get labelLarge => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: WFColors.textPrimary,
          height: 1.4,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get labelMedium => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: WFColors.textSecondary,
          height: 1.4,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get labelSmall => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: WFColors.textTertiary,
          height: 1.3,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  // Kicker (10sp, uppercase, 0.2em spacing, purple-300/80)
  static TextStyle get kicker => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: WFColors.purple300.withOpacity(0.8),
          letterSpacing: 0.2,
          height: 1.2,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  // Section titles (13sp, semibold, gray-200)
  static TextStyle get sectionTitle => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: WFColors.gray200,
          height: 1.3,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  // NEW: Special font for mentor responses with full Unicode support
  static TextStyle get mentorResponse => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: WFColors.textPrimary,
          height: 1.38,
        ),
        fallbackFonts: [
          'Arial Unicode MS', // Best Unicode support
          'Segoe UI', // Windows fallback
          'Helvetica Neue', // macOS fallback
          'Arial', // Universal fallback
          'sans-serif', // System fallback
        ],
      );

  // NEW: Font for code and technical content
  static TextStyle get codeText => _createFontWithFallbacks(
        primaryFont: GoogleFonts.jetBrainsMono(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: WFColors.textPrimary,
          height: 1.4,
        ),
        fallbackFonts: [
          'Consolas',
          'Monaco',
          'Courier New',
          'monospace',
        ],
      );

  // NEW: Font for emojis and special characters
  static TextStyle get emojiText => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: WFColors.textPrimary,
          height: 1.5,
        ),
        fallbackFonts: [
          'Apple Color Emoji', // iOS emoji support
          'Segoe UI Emoji', // Windows emoji support
          'Noto Color Emoji', // Android emoji support
          'Arial Unicode MS', // Full Unicode support
          'sans-serif',
        ],
      );

  // Button text styles (restored)
  static TextStyle get button => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: WFColors.textPrimary,
          height: 1.2,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  static TextStyle get buttonSmall => _createFontWithFallbacks(
        primaryFont: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: WFColors.textPrimary,
          height: 1.2,
        ),
        fallbackFonts: [
          'Arial Unicode MS',
          'Segoe UI',
          'Helvetica Neue',
          'Arial'
        ],
      );

  // Code text styles (restored)
  static TextStyle get code => _createFontWithFallbacks(
        primaryFont: GoogleFonts.jetBrainsMono(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: WFColors.textSecondary,
          height: 1.4,
        ),
        fallbackFonts: [
          'Consolas',
          'Monaco',
          'Courier New',
          'monospace',
        ],
      );

  static TextStyle get codeSmall => _createFontWithFallbacks(
        primaryFont: GoogleFonts.jetBrainsMono(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: WFColors.textTertiary,
          height: 1.3,
        ),
        fallbackFonts: [
          'Consolas',
          'Monaco',
          'Courier New',
          'monospace',
        ],
      );
}
