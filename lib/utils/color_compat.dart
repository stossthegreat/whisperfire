import 'dart:ui';

extension ColorCompat on Color {
  /// Drop-in shim so older SDKs can compile code that used withValues(alpha: x).
  Color withValues({double? alpha}) {
    if (alpha == null) return this;
    // clamp for safety
    final a = alpha.clamp(0.0, 1.0);
    return withOpacity(a);
  }
}
