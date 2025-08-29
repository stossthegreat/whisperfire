import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';
import '../atoms/atoms.dart';

class SkeletonCard extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const SkeletonCard({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  @override
  State<SkeletonCard> createState() => _SkeletonCardState();
}

class _SkeletonCardState extends State<SkeletonCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _bar({required double width, required double height, BorderRadius? r}) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: WFColors.gray600.withOpacity(_animation.value),
            borderRadius: r ?? BorderRadius.circular(4),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: widget.width,
      height: widget.height,
      child: widget.child ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header skeleton
              Row(
                children: [
                  _bar(width: 120, height: 20),
                  const Spacer(),
                  _bar(width: 60, height: 16),
                ],
              ),
              const SizedBox(height: WFDims.topLineFirstSection),

              // Content skeleton lines
              ...List.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < 3 ? WFDims.sectionSpacing : 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section title
                      Row(
                        children: [
                          _bar(width: 16, height: 16),
                          const SizedBox(width: WFDims.spacingL),
                          _bar(width: 80 + (index * 20).toDouble(), height: 14),
                        ],
                      ),
                      const SizedBox(height: WFDims.titleBodySpacing),

                      // Content lines (use widthFactor instead of infinity math)
                      ...List.generate(2, (lineIndex) {
                        final factor = lineIndex == 0 ? 1.0 : 0.8; // second line shorter
                        return Padding(
                          padding: EdgeInsets.only(bottom: lineIndex == 0 ? 6 : 0),
                          child: FractionallySizedBox(
                            widthFactor: factor,
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (_, __) {
                                return Container(
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: WFColors.gray700
                                        .withOpacity(_animation.value),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                );
              }),
            ],
          ),
    );
  }
}
