import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';
import '../../../data/providers.dart';
import '../../../data/models/profile_models.dart';
import '../../../data/models/lesson_models.dart';
import '../../../content/lessons_catalog.dart';
import '../../atoms/atoms.dart';
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
                            color: Colors.black, // Black text for lessons page
                          ),
                        ),
                        const SizedBox(height: 24),
                        ...kCategories.map((category) => 
                          _buildCategoryCard(context, category, profile)
                        ),
                      ],
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

  Widget _buildCategoryCard(BuildContext context, String category, UserProfile profile) {
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

  void _continueCategory(BuildContext context, String category, CategoryProgress progress) {
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

  int _prevThreshold(int level) => 
    level <= 1 ? 0 : level == 2 ? 100 : level == 3 ? 250 : 500;

  int _nextThreshold(int level) => 
    level == 1 ? 100 : level == 2 ? 250 : level == 3 ? 500 : 999999;

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
      case 'seduction': return const Color(0xFFE91E63);
      case 'gravity': return const Color(0xFF26A69A);
      case 'frame': return const Color(0xFF3F51B5);
      case 'scarcity': return const Color(0xFFFF9800);
      case 'psychwar': return const Color(0xFF9C27B0);
      case 'deception': return const Color(0xFF4CAF50);
      default: return Colors.purple;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'seduction': return Icons.favorite;
      case 'gravity': return Icons.arrow_downward;
      case 'frame': return Icons.crop_square;
      case 'scarcity': return Icons.trending_up;
      case 'psychwar': return Icons.psychology;
      case 'deception': return Icons.masks;
      default: return Icons.school;
    }
  }
} 