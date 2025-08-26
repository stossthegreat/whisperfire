import 'dart:ui';

extension ColorCompat on Color {
  /// Fallback for Flutter stable where withValues() is missing.
  Color withValues({double? alpha}) => withOpacity(alpha ?? this.opacity);
} 