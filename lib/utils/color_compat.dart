// lib/utils/color_compat.dart
import 'dart:ui';

extension ColorCompat on Color {
  /// Beguile AI compatibility for Flutter versions without Color.withValues
  /// Usage stays the same: color.withValues(alpha: 0.3)
  Color withValues({double? alpha, double? red, double? green, double? blue}) {
    final r = (red ?? this.red / 255.0).clamp(0.0, 1.0);
    final g = (green ?? this.green / 255.0).clamp(0.0, 1.0);
    final b = (blue ?? this.blue / 255.0).clamp(0.0, 1.0);
    final a = (alpha ?? this.opacity).clamp(0.0, 1.0);
    return Color.fromRGBO(
      (r * 255).round(),
      (g * 255).round(),
      (b * 255).round(),
      a,
    );
  }
}
