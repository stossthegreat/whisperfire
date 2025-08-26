import 'dart:ui';

extension ColorCompat on Color {
  Color withValues({double? alpha}) => withOpacity(alpha ?? this.opacity);
}
