import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';
import '../../../core/streak/streak_service.dart';
import '../../../core/streak/streak_flame.dart';
import '../../../data/providers.dart';
import '../../../data/models/profile_models.dart';
import '../../../data/models/lesson_models.dart';
import '../../../content/lessons_catalog.dart';
import '../../shared/loading_shell.dart';
import '../../../features/lessons/lesson_player/lesson_player_page.dart';
import '../../../widgets/app_header.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with TickerProviderStateMixin {
  late Map<String, AnimationController> _progressControllers;
  late Map<String, Animation<double>> _progressAnimations;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _progressControllers = {};
    _progressAnimations = {};

    for (final category in kCategories) {
      _progressControllers[category] = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
      _progressAnimations[category] = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _progressControllers[category]!,
        curve: Curves.easeOutCubic,
      ));
    }
  }

  @override
  void dispose() {
    for (final controller in _progressControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: const AppHeader(),
      body: SafeArea(
        child: profileAsync.when(
          data: (profile) {
            // Start animations after build
            WidgetsBinding.instance.addPostFrameCallback((_) {
              for (final controller in _progressControllers.values) {
                controller.forward();
              }
            });

            return CustomScrollView(
              slivers: [
                // Streak Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: FutureBuilder<StreakData>(
                      future: StreakService.getStreakData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final streakData = snapshot.data!;
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  WFColors.purple400.withOpacity(0.2),
                                  WFColors.purple600.withOpacity(0.1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: WFColors.purple400.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                // Streak Flame
                                StreakFlame(streak: streakData.currentStreak),
                                const SizedBox(width: 20),
                                // Streak Info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${streakData.currentStreak} Day Streak',
                                        style: GoogleFonts.playfairDisplay(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        StreakService.getStreakMessage(streakData.currentStreak),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: WFColors.gray400,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Longest: ${streakData.longestStreak} days',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: WFColors.gray500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                
                // Category cards
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Your Categories',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // White text for profile page
                          ),
                        ),
                        const SizedBox(height: 24),
                        ...kCategories.map((category) =>
                            _buildCategoryCard(context, category, profile)),
                      ],
                    ),
                  ),
                ),
                // Profile stats
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(WFDims.paddingL),
                    child: Container(
                      padding: const EdgeInsets.all(WFDims.paddingL),
                      decoration: BoxDecoration(
                        color: WFColors.gray800.withOpacity(0.3),
                        borderRadius:
                            BorderRadius.circular(WFDims.radiusMedium),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Profile Stats', style: WFTextStyles.h3),
                          const SizedBox(height: WFDims.spacingM),
                          // FIXED: Responsive stats layout to prevent overflow
                          LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth < 400) {
                                // Stack vertically on very small screens
                                return Column(
                                  children: [
                                    _StatCard(
                                      title: 'Total XP',
                                      value: '${profile.xpTotal}',
                                      icon: Icons.star,
                                      color: WFColors.purple400,
                                    ),
                                    const SizedBox(height: WFDims.spacingM),
                                    _StatCard(
                                      title: 'Lessons Completed',
                                      value:
                                          '${profile.unlockedLessons.length}',
                                      icon: Icons.school,
                                      color: WFColors.success,
                                    ),
                                  ],
                                );
                              } else {
                                // Side by side on larger screens
                                return Row(
                                  children: [
                                    Expanded(
                                      child: _StatCard(
                                        title: 'Total XP',
                                        value: '${profile.xpTotal}',
                                        icon: Icons.star,
                                        color: WFColors.purple400,
                                      ),
                                    ),
                                    const SizedBox(width: WFDims.spacingM),
                                    Expanded(
                                      child: _StatCard(
                                        title: 'Lessons Completed',
                                        value:
                                            '${profile.unlockedLessons.length}',
                                        icon: Icons.school,
                                        color: WFColors.success,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                          const SizedBox(height: WFDims.spacingM),
                          // Reset onboarding button for testing
                          ElevatedButton(
                            onPressed: () async {
                              profile.hasSeenOnboarding = false;
                              await ref
                                  .read(profileRepoProvider)
                                  .saveProfile(profile);
                              ref.invalidate(userProfileProvider);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Onboarding reset! Refresh the app to see it.')),
                                );
                              }
                            },
                            child: const Text('Reset Onboarding (Test)'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const LoadingShell(),
          error: (error, stack) => const Center(
            child: Text('Error loading profile'),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String category, UserProfile profile) {
    final categoryName = kCategoryNames[category]!;
    final color = _getCategoryColor(category);
    final progress = profile.categories[category] ?? CategoryProgress();

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    _getCategoryIcon(category),
                    color: color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryName,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Black text for lessons page
                        ),
                      ),
                      Text(
                        'Level ${progress.level}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${progress.xp} XP',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Progress bar
            AnimatedBuilder(
              animation: _progressAnimations[category]!,
              builder: (context, child) {
                final animatedProgress = _progressAnimations[category]!.value;
                final bandPercent = _bandPercent(progress.xp, progress.level);
                final animatedBandPercent = bandPercent * animatedProgress;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: animatedBandPercent,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'XP to next: ${_xpToNext(progress.level, progress.xp)}',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // Continue button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _continueCategory(context, category, progress),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _continueCategory(
      BuildContext context, String category, CategoryProgress progress) {
    // Find next lesson to continue
    final nextLesson = _findNextLesson(category, progress);

    if (nextLesson != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LessonPlayerPage(
            category: category,
            world: nextLesson.world,
            lesson: nextLesson.lesson,
          ),
        ),
      );
    } else {
      // Start from world 1, lesson 1 if no progress
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LessonPlayerPage(
            category: category,
            world: 1,
            lesson: 1,
          ),
        ),
      );
    }
  }

  Lesson? _findNextLesson(String category, CategoryProgress progress) {
    // TODO: Implement logic to find next lesson based on unlocked lessons
    // For now, return null to start from beginning
    return null;
  }

  int _prevThreshold(int level) => level <= 1
      ? 0
      : level == 2
          ? 100
          : level == 3
              ? 250
              : 500;

  int _nextThreshold(int level) => level == 1
      ? 100
      : level == 2
          ? 250
          : level == 3
              ? 500
              : 999999;

  double _bandPercent(int xp, int level) {
    final p = _prevThreshold(level);
    final n = _nextThreshold(level);
    final b = (xp - p).clamp(0, n - p).toDouble();
    return (n - p) == 0 ? 1.0 : b / (n - p);
  }

  int _xpToNext(int level, int xp) {
    final next = _nextThreshold(level);
    return (next - xp).clamp(0, 999999);
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'charisma':
        return const Color(0xFF9C27B0);
      case 'gravity':
        return const Color(0xFF9C27B0);
      case 'frame':
        return const Color(0xFF9C27B0);
      case 'scarcity':
        return const Color(0xFF9C27B0);
      case 'composed_authority':
        return const Color(0xFF9C27B0);
      case 'hidden_dynamics':
        return const Color(0xFF9C27B0);
      default:
        return Colors.purple;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'charisma':
        return Icons.favorite;
      case 'gravity':
        return Icons.arrow_downward;
      case 'frame':
        return Icons.crop_square;
      case 'scarcity':
        return Icons.trending_up;
      case 'composed_authority':
        return Icons.psychology;
      case 'hidden_dynamics':
        return Icons.masks;
      default:
        return Icons.school;
    }
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(WFDims.paddingM),
      decoration: BoxDecoration(
        color: WFColors.gray800.withOpacity(0.3),
        borderRadius: BorderRadius.circular(WFDims.radiusMedium),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: WFDims.spacingS),
              Expanded(
                child: Text(
                  title,
                  style: WFTextStyles.bodyMedium.copyWith(
                    color: WFColors.textSecondary,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: WFDims.spacingS),
          Text(
            value,
            style: WFTextStyles.h3.copyWith(color: color),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
