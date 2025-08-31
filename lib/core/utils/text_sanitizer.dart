import 'package:flutter/material.dart';

/// Utility class to sanitize text and handle problematic Unicode characters
class TextSanitizer {
  /// Cleans text by replacing problematic characters with safe alternatives
  static String sanitizeText(String text) {
    if (text.isEmpty) return text;

    return text
        // Replace smart quotes with standard quotes
        .replaceAll('"', '"')
        .replaceAll('"', '"')
        .replaceAll(''', "'")
        .replaceAll(''', "'")

        // Replace em dashes and en dashes with standard dashes
        .replaceAll('—', '-')
        .replaceAll('–', '-')

        // Replace other problematic characters
        .replaceAll('…', '...')
        .replaceAll('•', '*')
        .replaceAll('→', '->')
        .replaceAll('←', '<-')

        // Remove or replace other problematic Unicode
        .replaceAll(
            RegExp(r'[\u0000-\u001F\u007F-\u009F]'), '') // Control characters
        .replaceAll(RegExp(r'[\u2000-\u206F]'), ' ') // General punctuation
        .replaceAll(RegExp(r'[\u2100-\u214F]'), '') // Letterlike symbols
        .replaceAll(RegExp(r'[\u2200-\u22FF]'), '') // Mathematical operators
        .replaceAll(RegExp(r'[\u2300-\u23FF]'), '') // Miscellaneous technical
        .replaceAll(RegExp(r'[\u2400-\u243F]'), '') // Control pictures
        .replaceAll(
            RegExp(r'[\u2440-\u245F]'), '') // Optical character recognition
        .replaceAll(RegExp(r'[\u2460-\u24FF]'), '') // Enclosed alphanumerics
        .replaceAll(RegExp(r'[\u2500-\u257F]'), '') // Box drawing
        .replaceAll(RegExp(r'[\u2580-\u259F]'), '') // Block elements
        .replaceAll(RegExp(r'[\u25A0-\u25FF]'), '') // Geometric shapes
        .replaceAll(RegExp(r'[\u2600-\u26FF]'), '') // Miscellaneous symbols
        .replaceAll(RegExp(r'[\u2700-\u27BF]'), '') // Dingbats
        .replaceAll(RegExp(r'[\u2800-\u28FF]'), '') // Braille patterns
        .replaceAll(RegExp(r'[\u2900-\u297F]'), '') // Supplemental arrows
        .replaceAll(RegExp(r'[\u2980-\u29FF]'),
            '') // Miscellaneous mathematical symbols
        .replaceAll(RegExp(r'[\u2A00-\u2AFF]'),
            '') // Supplemental mathematical operators
        .replaceAll(
            RegExp(r'[\u2B00-\u2BFF]'), '') // Miscellaneous symbols and arrows
        .replaceAll(RegExp(r'[\u2C00-\u2C5F]'), '') // Glagolitic
        .replaceAll(RegExp(r'[\u2C60-\u2C7F]'), '') // Latin extended
        .replaceAll(RegExp(r'[\u2C80-\u2CFF]'), '') // Coptic
        .replaceAll(RegExp(r'[\u2D00-\u2D2F]'), '') // Georgian supplement
        .replaceAll(RegExp(r'[\u2D30-\u2D7F]'), '') // Tifinagh
        .replaceAll(RegExp(r'[\u2D80-\u2DDF]'), '') // Ethiopic extended
        .replaceAll(RegExp(r'[\u2DE0-\u2DFF]'), '') // Cyrillic extended
        .replaceAll(RegExp(r'[\u2E00-\u2E7F]'), '') // Supplemental punctuation
        .replaceAll(RegExp(r'[\u2E80-\u2EFF]'), '') // CJK radicals supplement
        .replaceAll(RegExp(r'[\u2F00-\u2FDF]'), '') // Kangxi radicals
        .replaceAll(RegExp(r'[\u2FF0-\u2FFF]'),
            '') // Ideographic description characters
        .replaceAll(
            RegExp(r'[\u3000-\u303F]'), '') // CJK symbols and punctuation
        .replaceAll(RegExp(r'[\u3040-\u309F]'), '') // Hiragana
        .replaceAll(RegExp(r'[\u30A0-\u30FF]'), '') // Katakana
        .replaceAll(RegExp(r'[\u3100-\u312F]'), '') // Bopomofo
        .replaceAll(RegExp(r'[\u3130-\u318F]'), '') // Hangul compatibility jamo
        .replaceAll(RegExp(r'[\u3190-\u319F]'), '') // Kanbun
        .replaceAll(RegExp(r'[\u31A0-\u31BF]'), '') // Bopomofo extended
        .replaceAll(RegExp(r'[\u31C0-\u31EF]'), '') // CJK strokes
        .replaceAll(
            RegExp(r'[\u31F0-\u31FF]'), '') // Katakana phonetic extensions
        .replaceAll(
            RegExp(r'[\u3200-\u32FF]'), '') // Enclosed CJK letters and months
        .replaceAll(RegExp(r'[\u3300-\u33FF]'), '') // CJK compatibility
        .replaceAll(RegExp(r'[\u3400-\u4DBF]'),
            '') // CJK unified ideographs extension A
        .replaceAll(RegExp(r'[\u4DC0-\u4DFF]'), '') // Yijing hexagram symbols
        .replaceAll(RegExp(r'[\u4E00-\u9FFF]'), '') // CJK unified ideographs
        .replaceAll(RegExp(r'[\uA000-\uA48F]'), '') // Yi syllables
        .replaceAll(RegExp(r'[\uA490-\uA4CF]'), '') // Yi radicals
        .replaceAll(RegExp(r'[\uA4D0-\uA4FF]'), '') // Lisu
        .replaceAll(RegExp(r'[\uA500-\uA63F]'), '') // Vai
        .replaceAll(RegExp(r'[\uA640-\uA69F]'), '') // Cyrillic extended
        .replaceAll(RegExp(r'[\uA6A0-\uA6FF]'), '') // Bamum
        .replaceAll(RegExp(r'[\uA700-\uA71F]'), '') // Modifier tone letters
        .replaceAll(RegExp(r'[\uA720-\uA7FF]'), '') // Latin extended
        .replaceAll(RegExp(r'[\uA800-\uA82F]'), '') // Syloti nagri
        .replaceAll(RegExp(r'[\uA830-\uA83F]'), '') // Common Indic number forms
        .replaceAll(RegExp(r'[\uA840-\uA87F]'), '') // Phags-pa
        .replaceAll(RegExp(r'[\uA880-\uA8DF]'), '') // Saurashtra
        .replaceAll(RegExp(r'[\uA8E0-\uA8FF]'), '') // Devanagari extended
        .replaceAll(RegExp(r'[\uA900-\uA92F]'), '') // Kayah li
        .replaceAll(RegExp(r'[\uA930-\uA95F]'), '') // Rejang
        .replaceAll(RegExp(r'[\uA960-\uA97F]'), '') // Hangul jamo extended A
        .replaceAll(RegExp(r'[\uA980-\uA9DF]'), '') // Javanese
        .replaceAll(RegExp(r'[\uA9E0-\uA9FF]'), '') // Myanmar extended
        .replaceAll(RegExp(r'[\uAA00-\uAA5F]'), '') // Cham
        .replaceAll(RegExp(r'[\uAA60-\uAA7F]'), '') // Myanmar extended A
        .replaceAll(RegExp(r'[\uAA80-\uAADF]'), '') // Tai viet
        .replaceAll(RegExp(r'[\uAAE0-\uAAFF]'), '') // Meetei mayek extensions
        .replaceAll(RegExp(r'[\uAB00-\uAB2F]'), '') // Ethiopic extended A
        .replaceAll(RegExp(r'[\uAB30-\uAB6F]'), '') // Latin extended
        .replaceAll(RegExp(r'[\uAB70-\uABBF]'), '') // Cherokee supplement
        .replaceAll(RegExp(r'[\uABC0-\uABFF]'), '') // Meetei mayek
        .replaceAll(RegExp(r'[\uAC00-\uD7AF]'), '') // Hangul syllables
        .replaceAll(RegExp(r'[\uD7B0-\uD7FF]'), '') // Hangul jamo extended B
        .replaceAll(RegExp(r'[\uD800-\uDB7F]'), '') // High surrogate halves
        .replaceAll(
            RegExp(r'[\uDB80-\uDBFF]'), '') // High private use surrogate halves
        .replaceAll(RegExp(r'[\uDC00-\uDFFF]'), '') // Low surrogate halves
        .replaceAll(RegExp(r'[\uE000-\uF8FF]'), '') // Private use area
        .replaceAll(
            RegExp(r'[\uF900-\uFAFF]'), '') // CJK compatibility ideographs
        .replaceAll(
            RegExp(r'[\uFB00-\uFB4F]'), '') // Alphabetic presentation forms
        .replaceAll(
            RegExp(r'[\uFB50-\uFDFF]'), '') // Arabic presentation forms A
        .replaceAll(RegExp(r'[\uFE00-\uFE0F]'), '') // Variation selectors
        .replaceAll(RegExp(r'[\uFE10-\uFE1F]'), '') // Vertical forms
        .replaceAll(RegExp(r'[\uFE20-\uFE2F]'), '') // Combining half marks
        .replaceAll(RegExp(r'[\uFE30-\uFE4F]'), '') // CJK compatibility forms
        .replaceAll(RegExp(r'[\uFE50-\uFE6F]'), '') // Small form variants
        .replaceAll(
            RegExp(r'[\uFE70-\uFEFF]'), '') // Arabic presentation forms B
        .replaceAll(
            RegExp(r'[\uFF00-\uFFEF]'), '') // Halfwidth and fullwidth forms
        .replaceAll(RegExp(r'[\uFFF0-\uFFFF]'), ''); // Specials
  }

  /// Checks if text contains problematic characters
  static bool hasProblematicCharacters(String text) {
    if (text.isEmpty) return false;

    // Check for common problematic characters
    final problematicPattern = RegExp(r'[""'
        '—–…•→←]|[\u0000-\u001F\u007F-\u009F]|[\u2000-\u206F]|[\u2100-\u214F]|[\u2200-\u22FF]|[\u2300-\u23FF]|[\u2400-\u245F]|[\u2460-\u24FF]|[\u2500-\u257F]|[\u2580-\u259F]|[\u25A0-\u25FF]|[\u2600-\u26FF]|[\u2700-\u27BF]|[\u2800-\u28FF]|[\u2900-\u297F]|[\u2980-\u29FF]|[\u2A00-\u2AFF]|[\u2B00-\u2BFF]|[\u2C00-\u2C5F]|[\u2C60-\u2C7F]|[\u2C80-\u2CFF]|[\u2D00-\u2D2F]|[\u2D30-\u2D7F]|[\u2D80-\u2DDF]|[\u2DE0-\u2DFF]|[\u2E00-\u2E7F]|[\u2E80-\u2EFF]|[\u2F00-\u2FDF]|[\u2FF0-\u2FFF]|[\u3000-\u303F]|[\u3040-\u309F]|[\u30A0-\u30FF]|[\u3100-\u312F]|[\u3130-\u318F]|[\u3190-\u319F]|[\u31A0-\u31BF]|[\u31C0-\u31EF]|[\u31F0-\u31FF]|[\u3200-\u32FF]|[\u3300-\u33FF]|[\u3400-\u4DBF]|[\u4DC0-\u4DFF]|[\u4E00-\u9FFF]|[\uA000-\uA48F]|[\uA490-\uA4CF]|[\uA4D0-\uA4FF]|[\uA500-\uA63F]|[\uA640-\uA69F]|[\uA6A0-\uA6FF]|[\uA700-\uA71F]|[\uA720-\uA7FF]|[\uA800-\uA82F]|[\uA830-\uA83F]|[\uA840-\uA87F]|[\uA880-\uA8DF]|[\uA8E0-\uA8FF]|[\uA900-\uA92F]|[\uA930-\uA95F]|[\uA960-\uA97F]|[\uA980-\uA9DF]|[\uA9E0-\uA9FF]|[\uAA00-\uAA5F]|[\uAA60-\uAA7F]|[\uAA80-\uAADF]|[\uAAE0-\uAAFF]|[\uAB00-\uAB2F]|[\uAB30-\uAB6F]|[\uAB70-\uABBF]|[\uABC0-\uABFF]|[\uAC00-\uD7AF]|[\uD7B0-\uD7FF]|[\uD800-\uDB7F]|[\uDB80-\uDBFF]|[\uDC00-\uDFFF]|[\uE000-\uF8FF]|[\uF900-\uFAFF]|[\uFB00-\uFB4F]|[\uFB50-\uFDFF]|[\uFE00-\uFE0F]|[\uFE10-\uFE1F]|[\uFE20-\uFE2F]|[\uFE30-\uFE4F]|[\uFE50-\uFE6F]|[\uFE70-\uFEFF]|[\uFF00-\uFFEF]|[\uFFF0-\uFFFF]');

    return problematicPattern.hasMatch(text);
  }

  /// Creates a safe text widget that handles problematic characters gracefully
  static Widget createSafeText(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    final sanitizedText = sanitizeText(text);

    return Text(
      sanitizedText,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
