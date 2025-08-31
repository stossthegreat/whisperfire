import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'streak_flame.dart';
import 'streak_service.dart';

class StreakCard extends StatefulWidget {
  final StreakData streakData;
  final VoidCallback? onTap;

  const StreakCard({
    super.key,
    required this.streakData,
    this.onTap,
  });

  @override
  State<StreakCard> createState() => _StreakCardState();
}

class _StreakCardState extends State<StreakCard>
    with TickerProviderStateMixin {
  late AnimationController _cardController;
  late AnimationController _pulseController;
  late Animation<double> _cardAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _cardController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _cardAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _cardController,
      curve: Curves.elasticOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _cardController.forward();
    
    if (widget.streakData.currentStreak > 0) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _cardController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_cardController, _pulseController]),
      builder: (context, child) {
        return Transform.scale(
          scale: _cardAnimation.value,
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.orange.shade400,
                    Colors.deepOrange.shade600,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Flame
                    Transform.scale(
                      scale: _pulseAnimation.value,
                      child: StreakFlame(streak: widget.streakData.currentStreak),
                    ),
                    
                    const SizedBox(width: 20),
                    
                    // Streak info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StreakService.getStreakMessage(widget.streakData.currentStreak),
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          
                          // Streak multiplier
                          if (widget.streakData.currentStreak > 1)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${StreakService.getStreakMultiplier(widget.streakData.currentStreak).toStringAsFixed(1)}x XP',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          
                          const SizedBox(height: 8),
                          
                          // Longest streak
                          if (widget.streakData.longestStreak > 0)
                            Text(
                              'Longest: ${widget.streakData.longestStreak} days',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                        ],
                      ),
                    ),
                    
                    // Arrow icon
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white.withOpacity(0.7),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StreakAchievementCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool unlocked;

  const StreakAchievementCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: unlocked ? color.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: unlocked ? color.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: unlocked ? color.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: unlocked ? color : Colors.grey,
                size: 20,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: unlocked ? Colors.black87 : Colors.grey,
                    ),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: unlocked ? Colors.black54 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (unlocked)
              Icon(
                Icons.check_circle,
                color: color,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
} 