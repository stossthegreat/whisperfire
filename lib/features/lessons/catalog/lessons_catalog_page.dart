import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/providers.dart';
import '../../../data/models/profile_models.dart';
import '../../../core/theme/theme.dart';
import '../world_overview/world_overview_page.dart';

class LessonsCatalogPage extends ConsumerWidget {
  const LessonsCatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Categories'),
        backgroundColor: WFColors.base,
        foregroundColor: WFColors.textPrimary,
      ),
      body: profileAsync.when(
        data: (profile) => _buildCategoriesGrid(context, profile),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error loading profile')),
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context, UserProfile profile) {
    const categoryData = [
      {'slug': 'seduction', 'name': 'Magnetic Presence', 'color': 0xFFE91E63, 'emoji': '💫'},
      {'slug': 'gravity', 'name': 'Composed Authority', 'color': 0xFF26A69A, 'emoji': '❄️'},
      {'slug': 'frame', 'name': 'Conversation Frames', 'color': 0xFF3F51B5, 'emoji': '🎭'},
      {'slug': 'scarcity', 'name': 'Scarcity & Desire', 'color': 0xFFFF9800, 'emoji': '💎'},
      {'slug': 'deception', 'name': 'Hidden Dynamics', 'color': 0xFF9C27B0, 'emoji': '🎭'},
      {'slug': 'coldpower', 'name': 'Cold Power', 'color': 0xFF4CAF50, 'emoji': '⚔️'},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: categoryData.length,
      itemBuilder: (context, index) {
        final category = categoryData[index];
        final categoryProgress = profile.categories[category['slug']!] ?? CategoryProgress();
        
        return _buildCategoryCard(
          context,
          category['slug'] as String,
          category['name'] as String,
          category['color'] as int,
          category['emoji'] as String,
          categoryProgress,
        );
      },
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String categorySlug,
    String categoryName,
    int color,
    String emoji,
    CategoryProgress progress,
  ) {
    return GestureDetector(
      onTap: () {
        print('🔍 DEBUG: Category card tapped with slug: $categorySlug');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WorldOverviewPage(category: categorySlug),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(color).withValues(alpha: 0.05),
              Color(color).withValues(alpha: 0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(color).withValues(alpha: 0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(color).withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 32,
              offset: const Offset(0, 12),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 48),
              ),
              const SizedBox(height: 16),
              Text(
                categoryName,
                style: WFTextStyles.h3.copyWith(
                  color: Color(color),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Lv.${progress.level}',
                  style: WFTextStyles.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${progress.xp} XP',
                style: WFTextStyles.bodySmall.copyWith(
                  color: Color(color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 