import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/streak/streak_service.dart';
import '../../core/streak/streak_card.dart';
import '../../core/streak/streak_flame.dart';

class StreakPage extends ConsumerStatefulWidget {
  const StreakPage({super.key});

  @override
  ConsumerState<StreakPage> createState() => _StreakPageState();
}

class _StreakPageState extends ConsumerState<StreakPage> {
  StreakData? _streakData;

  @override
  void initState() {
    super.initState();
    _loadStreakData();
  }

  Future<void> _loadStreakData() async {
    final data = await StreakService.getStreakData();
    setState(() {
      _streakData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_streakData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Your Streak',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main streak card
            StreakCard(
              streakData: _streakData!,
              onTap: () {
                // Show streak details
                _showStreakDetails(context);
              },
            ),
            
            const SizedBox(height: 20),
            
            // Achievements section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achievements',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  // Achievement cards
                  StreakAchievementCard(
                    title: 'First Flame',
                    description: 'Complete your first lesson',
                    icon: Icons.local_fire_department,
                    color: Colors.orange,
                    unlocked: _streakData!.currentStreak > 0,
                  ),
                  
                  StreakAchievementCard(
                    title: 'Week Warrior',
                    description: 'Maintain a 7-day streak',
                    icon: Icons.weekend,
                    color: Colors.deepOrange,
                    unlocked: _streakData!.longestStreak >= 7,
                  ),
                  
                  StreakAchievementCard(
                    title: 'Monthly Master',
                    description: 'Maintain a 30-day streak',
                    icon: Icons.calendar_month,
                    color: Colors.red,
                    unlocked: _streakData!.longestStreak >= 30,
                  ),
                  
                  StreakAchievementCard(
                    title: 'Century Club',
                    description: 'Maintain a 100-day streak',
                    icon: Icons.emoji_events,
                    color: Colors.purple,
                    unlocked: _streakData!.longestStreak >= 100,
                  ),
                  
                  StreakAchievementCard(
                    title: 'Unstoppable',
                    description: 'Maintain a 365-day streak',
                    icon: Icons.workspace_premium,
                    color: Colors.amber,
                    unlocked: _streakData!.longestStreak >= 365,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Tips section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blue.shade200,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        color: Colors.blue.shade600,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Streak Tips',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  
                  _buildTip('Complete at least one lesson every day'),
                  _buildTip('Use streak freezes when you need a break'),
                  _buildTip('Higher streaks give you bonus XP multipliers'),
                  _buildTip('Set a daily reminder to maintain your streak'),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTip(String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6, right: 10),
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              tip,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.blue.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showStreakDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Large flame
              Center(
                child: StreakFlame(streak: _streakData!.currentStreak),
              ),
              
              const SizedBox(height: 20),
              
              Text(
                StreakService.getStreakMessage(_streakData!.currentStreak),
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20),
              
              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat('Current Streak', '${_streakData!.currentStreak} days'),
                  _buildStat('Longest Streak', '${_streakData!.longestStreak} days'),
                  _buildStat('XP Multiplier', '${StreakService.getStreakMultiplier(_streakData!.currentStreak).toStringAsFixed(1)}x'),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Close button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
} 