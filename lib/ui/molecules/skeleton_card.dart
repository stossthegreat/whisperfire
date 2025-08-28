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

class _SkeletonCardState extends State<SkeletonCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.3,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: widget.width,
      height: widget.height,
      child: widget.child ?? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header skeleton
          Row(
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: 120,
                    height: 20,
                    decoration: BoxDecoration(
                      color: WFColors.gray600.withValues(alpha: _animation.value),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: 60,
                    height: 16,
                    decoration: BoxDecoration(
                      color: WFColors.gray600.withValues(alpha: _animation.value),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: WFDims.topLineFirstSection),
          
          // Content skeleton lines
          ...List.generate(4, (index) => Padding(
            padding: EdgeInsets.only(
              bottom: index < 3 ? WFDims.sectionSpacing : 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section title
                Row(
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: WFColors.gray600.withValues(alpha: _animation.value),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: WFDims.spacingL),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Container(
                          width: 80 + (index * 20).toDouble(),
                          height: 14,
                          decoration: BoxDecoration(
                            color: WFColors.gray600.withValues(alpha: _animation.value),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: WFDims.titleBodySpacing),
                
                // Content lines
                ...List.generate(2, (lineIndex) => Padding(
                  padding: EdgeInsets.only(
                    bottom: lineIndex < 1 ? 6 : 0,
                  ),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Container(
                        width: double.infinity - (lineIndex * 40),
                        height: 12,
                        decoration: BoxDecoration(
                          color: WFColors.gray700.withValues(alpha: _animation.value),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    },
                  ),
                )),
              ],
            ),
          )),
        ],
      ),
    );
  }
} 