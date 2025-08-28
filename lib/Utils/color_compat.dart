import 'dart:ui';

extension ColorCompat on Color {
  Color withValues({double? alpha}) => Color.fromARGB(
    (alpha ?? (a / 255.0) * 255).round(),
    r.toInt(),
    g.toInt(),
    b.toInt(),
  );
}
