import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/theme.dart';
import '../../../core/taxonomy/tag_registry.dart';
import '../../../data/providers.dart';
import '../../../data/models/profile_models.dart';

import '../../shared/loading_shell.dart';
import '../../../features/lessons/world_overview/world_overview_page.dart';
import '../../../widgets/app_header.dart';

class LessonsPage extends ConsumerStatefulWidget {
  const LessonsPage({super.key});

  @override
  ConsumerState<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends ConsumerState<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: const AppHeader(),
      body: SafeArea(
        child: profileAsync.when(
          data: (profile) {
            return _LessonsContent(profile: profile);
          },
          loading: () {
            return const LoadingShell();
          },
          error: (error, stack) {
            return const Center(
              child: Text('Error loading profile'),
            );
          },
        ),
      ),
    );
  }
}

class _LessonsContent extends ConsumerWidget {
  final UserProfile profile;

  const _LessonsContent({required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(WFDims.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with XP
          Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: WFGradients.purpleGradient,
                    borderRadius: BorderRadius.circular(WFDims.radiusXLarge),
                    boxShadow: WFShadows.purpleGlow,
                  ),
                  child: const Icon(
                    Icons.school,
                    size: 40,
                    color: WFColors.textPrimary,
                  ),
                ),
                const SizedBox(height: WFDims.spacingL),
                Text('Learning Hub',
                    style: WFTextStyles.h1.copyWith(color: Colors.white)),
                const SizedBox(height: WFDims.spacingS),
                Text(
                  'Total XP: ${profile.xpTotal}',
                  style: WFTextStyles.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: WFDims.spacingXL),

          // Categories Grid
          Text(
            'Choose Your Path',
            style: WFTextStyles.h2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: WFDims.spacingL),

          // Categories Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
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
          ),
        ],
      ),
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WorldOverviewPage(category: categorySlug),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(color).withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(color).withOpacity(0.3)),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                emoji,
                style: TextStyle(fontSize: screenWidth * 0.09),
              ),
              SizedBox(height: screenHeight * 0.015),
              Flexible(
                child: Text(
                  categoryName,
                  style: WFTextStyles.h4.copyWith(
                    color: Color(color),
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.035,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.025,
                    vertical: screenHeight * 0.005),
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Lv.${progress.level}',
                  style: WFTextStyles.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.025,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.008),
              Text(
                '${progress.xp} XP',
                style: WFTextStyles.bodySmall.copyWith(
                  color: Color(color),
                  fontSize: screenWidth * 0.025,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
