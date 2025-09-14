import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';
import '../../../core/taxonomy/tag_registry.dart';
import '../../../data/providers.dart';
import '../../../data/models/profile_models.dart';
import '../world_overview/world_overview_page.dart';

class LessonsCatalogPage extends ConsumerWidget {
  const LessonsCatalogPage({super.key});

  // Resolve image base path for category, supporting custom names for specific slugs
  String _categoryAssetBase(String slug) {
    switch (slug) {
      case 'composed_authority':
        return 'assets/images/categories/emotional_alchemy';
      case 'strategic_influence':
        return 'assets/images/categories/psychological_gravity';
      default:
        return 'assets/images/categories/$slug';
    }
  }

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
    final categoryData = [
      {
        'slug': 'magnetic_presence',
        'name': displayTag('magnetic_presence'),
        'color': 0xFFE91E63,
        'emoji': '💫'
      },
      {
        'slug': 'composed_authority',
        'name': displayTag('composed_authority'),
        'color': 0xFF26A69A,
        'emoji': '❄️'
      },
      {
        'slug': 'conversation_frames',
        'name': displayTag('conversation_frames'),
        'color': 0xFF3F51B5,
        'emoji': '🎭'
      },
      {
        'slug': 'scarcity_desire',
        'name': displayTag('scarcity_desire'),
        'color': 0xFFFF9800,
        'emoji': '💎'
      },
      {
        'slug': 'hidden_dynamics',
        'name': displayTag('hidden_dynamics'),
        'color': 0xFF9C27B0,
        'emoji': '🎭'
      },
      {
        'slug': 'strategic_influence',
        'name': displayTag('strategic_influence'),
        'color': 0xFF4CAF50,
        'emoji': '⚔️'
      },
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
        final categoryProgress =
            profile.categories[category['slug']!] ?? CategoryProgress();

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
    final isUnlocked = true; // Catalog screen is purely visual; tap always navigates
    final String assetBase = _categoryAssetBase(categorySlug);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WorldOverviewPage(category: categorySlug),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                '$assetBase.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    '$assetBase.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context2, error2, stackTrace2) {
                      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                              Color(color).withOpacity(0.08),
                              Color(color).withOpacity(0.16),
            ],
          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            // Subtle gradient (future-proof)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.12),
                      Colors.black.withOpacity(0.28),
                    ],
                ),
              ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
