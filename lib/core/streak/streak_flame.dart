import 'package:flutter/material.dart';
import 'dart:math' as math;

class StreakFlame extends StatefulWidget {
  final int streak;

  const StreakFlame({super.key, required this.streak});

  @override
  State<StreakFlame> createState() => _StreakFlameState();
}

class _StreakFlameState extends State<StreakFlame>
    with TickerProviderStateMixin {
  late AnimationController _flameController;
  late AnimationController _pulseController;
  late Animation<double> _flameAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _flameController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _flameAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _flameController,
      curve: Curves.easeInOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _flameController.repeat(reverse: true);
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _flameController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  double _getFlameSize() {
    if (widget.streak == 0) return 40;
    if (widget.streak < 7) return 50;
    if (widget.streak < 30) return 60;
    if (widget.streak < 100) return 70;
    return 80;
  }

  Color _getFlameColor() {
    if (widget.streak == 0) return Colors.grey;
    if (widget.streak < 7) return Colors.orange;
    if (widget.streak < 30) return Colors.deepOrange;
    if (widget.streak < 100) return Colors.red;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    final size = _getFlameSize();
    final color = _getFlameColor();

    return AnimatedBuilder(
      animation: Listenable.merge([_flameAnimation, _pulseAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: FlamePainter(
                color: color,
                animationValue: _flameAnimation.value,
              ),
            ),
          ),
        );
      },
    );
  }
}

class FlamePainter extends CustomPainter {
  final Color color;
  final double animationValue;

  FlamePainter({required this.color, required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * animationValue;

    // Main flame body
    final flamePath = Path();
    flamePath.moveTo(center.dx, center.dy - radius * 0.8);
    flamePath.quadraticBezierTo(
      center.dx - radius * 0.3,
      center.dy - radius * 0.4,
      center.dx - radius * 0.2,
      center.dy + radius * 0.2,
    );
    flamePath.quadraticBezierTo(
      center.dx,
      center.dy + radius * 0.1,
      center.dx + radius * 0.2,
      center.dy + radius * 0.2,
    );
    flamePath.quadraticBezierTo(
      center.dx + radius * 0.3,
      center.dy - radius * 0.4,
      center.dx,
      center.dy - radius * 0.8,
    );
    flamePath.close();

    canvas.drawPath(flamePath, paint);

    // Inner flame (brighter)
    final innerPaint = Paint()
      ..color = color.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    final innerRadius = radius * 0.6;
    final innerFlamePath = Path();
    innerFlamePath.moveTo(center.dx, center.dy - innerRadius * 0.8);
    innerFlamePath.quadraticBezierTo(
      center.dx - innerRadius * 0.3,
      center.dy - innerRadius * 0.4,
      center.dx - innerRadius * 0.2,
      center.dy + innerRadius * 0.2,
    );
    innerFlamePath.quadraticBezierTo(
      center.dx,
      center.dy + innerRadius * 0.1,
      center.dx + innerRadius * 0.2,
      center.dy + innerRadius * 0.2,
    );
    innerFlamePath.quadraticBezierTo(
      center.dx + innerRadius * 0.3,
      center.dy - innerRadius * 0.4,
      center.dx,
      center.dy - innerRadius * 0.8,
    );
    innerFlamePath.close();

    canvas.drawPath(innerFlamePath, innerPaint);

    // Sparkles for higher streaks
    if (animationValue > 1.0) {
      final sparklePaint = Paint()
        ..color = Colors.yellow
        ..style = PaintingStyle.fill;

      final sparkleRadius = 2.0;
      final sparklePositions = [
        Offset(center.dx - radius * 0.4, center.dy - radius * 0.6),
        Offset(center.dx + radius * 0.4, center.dy - radius * 0.5),
        Offset(center.dx - radius * 0.3, center.dy + radius * 0.3),
        Offset(center.dx + radius * 0.3, center.dy + radius * 0.2),
      ];

      for (final position in sparklePositions) {
        canvas.drawCircle(position, sparkleRadius, sparklePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
} 