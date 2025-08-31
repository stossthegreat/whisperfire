import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme.dart';
import '../../../core/taxonomy/tag_registry.dart';
import '../../../data/providers.dart';
import '../../../data/models/profile_models.dart';
import '../../../ui/atoms/atoms.dart';

class CategoryOverviewPage extends ConsumerWidget {
  final String category;

  const CategoryOverviewPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(category.toUpperCase()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: profileAsync.when(
        data: (profile) => _buildWorldsList(context, profile),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error loading profile')),
      ),
    );
  }

  Widget _buildWorldsList(BuildContext context, UserProfile profile) {
    // Define worlds for each category
    final worlds = _getWorldsForCategory(category);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(WFDims.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category header
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
                  child: Icon(
                    _getCategoryIcon(category),
                    size: 40,
                    color: WFColors.textPrimary,
                  ),
                ),
                const SizedBox(height: WFDims.spacingL),
                Text(
                  '${category.toUpperCase()} Training',
                  style: WFTextStyles.h2,
                ),
                const SizedBox(height: WFDims.spacingS),
                Text(
                  _getCategoryDescription(category),
                  style: WFTextStyles.bodyMedium.copyWith(
                    color: WFColors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: WFDims.spacingXXL),

          // Worlds
          Text('Training Worlds', style: WFTextStyles.h3),
          const SizedBox(height: WFDims.spacingL),

          ...worlds.map((world) => _buildWorldCard(context, world, profile)),
        ],
      ),
    );
  }

  Widget _buildWorldCard(
      BuildContext context, Map<String, dynamic> world, UserProfile profile) {
    final worldNumber = world['world'] as int;
    final title = world['title'] as String;
    final subtitle = world['subtitle'] as String;
    final emoji = world['emoji'] as String;
    final lessonCount = world['lessonCount'] as int;
    final requiredXp = world['requiredXp'] as int;
    final isUnlocked = profile.xpTotal >= requiredXp;

    final categoryProgress = profile.categories[category];
    final completedLessons = categoryProgress?.xp ?? 0;
    final level = categoryProgress?.level ?? 1;

    return Padding(
      padding: EdgeInsets.only(bottom: WFDims.spacingL),
      child: GlassCard(
        child: InkWell(
          onTap: isUnlocked
              ? () => _navigateToWorld(context, category, worldNumber)
              : null,
          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: isUnlocked
                      ? WFGradients.purpleGradient
                      : WFGradients.purpleGradient,
                  borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: WFDims.spacingL),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: WFTextStyles.h4.copyWith(
                        color: isUnlocked
                            ? WFColors.textPrimary
                            : WFColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: WFTextStyles.bodySmall
                          .copyWith(color: WFColors.textTertiary),
                    ),
                    const SizedBox(height: WFDims.spacingS),
                    Row(
                      children: [
                        Text(
                          '$lessonCount lessons',
                          style: WFTextStyles.labelMedium.copyWith(
                            color: isUnlocked
                                ? WFColors.purple400
                                : WFColors.gray500,
                          ),
                        ),
                        if (isUnlocked && completedLessons > 0) ...[
                          const SizedBox(width: WFDims.spacingM),
                          Text(
                            'Level $level • ${completedLessons} XP',
                            style: WFTextStyles.labelSmall.copyWith(
                              color: WFColors.purple400,
                            ),
                          ),
                        ],
                        if (!isUnlocked) ...[
                          const SizedBox(width: WFDims.spacingM),
                          Text(
                            'Requires ${requiredXp} XP',
                            style: WFTextStyles.labelSmall.copyWith(
                              color: WFColors.gray500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                isUnlocked ? Icons.chevron_right : Icons.lock,
                color: isUnlocked ? WFColors.purple400 : WFColors.gray500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getWorldsForCategory(String category) {
    switch (category) {
      case 'magnetic_presence':
        return [
          {
            'world': 1,
            'title': displayTag('magnetic_presence'),
            'subtitle': 'Foundation Skills',
            'emoji': '💫',
            'lessonCount': 5,
            'requiredXp': 0,
          },
          {
            'world': 2,
            'title': displayTag('magnetic_presence'),
            'subtitle': 'Advanced Techniques',
            'emoji': '🌟',
            'lessonCount': 5,
            'requiredXp': 100,
          },
          {
            'world': 3,
            'title': displayTag('magnetic_presence'),
            'subtitle': 'Mastery Level',
            'emoji': '✨',
            'lessonCount': 5,
            'requiredXp': 200,
          },
          {
            'world': 4,
            'title': displayTag('magnetic_presence'),
            'subtitle': 'Expert Level',
            'emoji': '💎',
            'lessonCount': 5,
            'requiredXp': 300,
          },
        ];
      case 'composed_authority':
        return [
          {
            'world': 1,
            'title': displayTag('composed_authority'),
            'subtitle': 'Foundation Skills',
            'emoji': '❄️',
            'lessonCount': 5,
            'requiredXp': 0,
          },
          {
            'world': 2,
            'title': displayTag('composed_authority'),
            'subtitle': 'Advanced Techniques',
            'emoji': '🧊',
            'lessonCount': 5,
            'requiredXp': 100,
          },
          {
            'world': 3,
            'title': displayTag('composed_authority'),
            'subtitle': 'Mastery Level',
            'emoji': '💎',
            'lessonCount': 5,
            'requiredXp': 200,
          },
          {
            'world': 4,
            'title': displayTag('composed_authority'),
            'subtitle': 'Expert Level',
            'emoji': '👑',
            'lessonCount': 5,
            'requiredXp': 300,
          },
        ];
      case 'conversation_frames':
        return [
          {
            'world': 1,
            'title': displayTag('conversation_frames'),
            'subtitle': 'Foundation Skills',
            'emoji': '🎭',
            'lessonCount': 5,
            'requiredXp': 0,
          },
          {
            'world': 2,
            'title': displayTag('conversation_frames'),
            'subtitle': 'Advanced Techniques',
            'emoji': '🎪',
            'lessonCount': 5,
            'requiredXp': 100,
          },
          {
            'world': 3,
            'title': displayTag('conversation_frames'),
            'subtitle': 'Mastery Level',
            'emoji': '🎨',
            'lessonCount': 5,
            'requiredXp': 200,
          },
          {
            'world': 4,
            'title': displayTag('conversation_frames'),
            'subtitle': 'Expert Level',
            'emoji': '🎯',
            'lessonCount': 5,
            'requiredXp': 300,
          },
        ];
      case 'scarcity_desire':
        return [
          {
            'world': 1,
            'title': displayTag('scarcity_desire'),
            'subtitle': 'Foundation Skills',
            'emoji': '💎',
            'lessonCount': 5,
            'requiredXp': 0,
          },
          {
            'world': 2,
            'title': displayTag('scarcity_desire'),
            'subtitle': 'Advanced Techniques',
            'emoji': '⏰',
            'lessonCount': 5,
            'requiredXp': 100,
          },
          {
            'world': 3,
            'title': displayTag('scarcity_desire'),
            'subtitle': 'Mastery Level',
            'emoji': '💎',
            'lessonCount': 5,
            'requiredXp': 200,
          },
          {
            'world': 4,
            'title': displayTag('scarcity_desire'),
            'subtitle': 'Expert Level',
            'emoji': '👑',
            'lessonCount': 5,
            'requiredXp': 300,
          },
        ];
      case 'hidden_dynamics':
        return [
          {
            'world': 1,
            'title': displayTag('hidden_dynamics'),
            'subtitle': 'Foundation Skills',
            'emoji': '🎭',
            'lessonCount': 5,
            'requiredXp': 0,
          },
          {
            'world': 2,
            'title': displayTag('hidden_dynamics'),
            'subtitle': 'Advanced Techniques',
            'emoji': '🎪',
            'lessonCount': 5,
            'requiredXp': 100,
          },
          {
            'world': 3,
            'title': displayTag('hidden_dynamics'),
            'subtitle': 'Mastery Level',
            'emoji': '🎨',
            'lessonCount': 5,
            'requiredXp': 200,
          },
          {
            'world': 4,
            'title': displayTag('hidden_dynamics'),
            'subtitle': 'Expert Level',
            'emoji': '🎯',
            'lessonCount': 5,
            'requiredXp': 300,
          },
        ];
      case 'strategic_influence':
        return [
          {
            'world': 1,
            'title': displayTag('strategic_influence'),
            'subtitle': 'Foundation Skills',
            'emoji': '⚔️',
            'lessonCount': 5,
            'requiredXp': 0,
          },
          {
            'world': 2,
            'title': displayTag('strategic_influence'),
            'subtitle': 'Advanced Techniques',
            'emoji': '🎯',
            'lessonCount': 5,
            'requiredXp': 100,
          },
          {
            'world': 3,
            'title': displayTag('strategic_influence'),
            'subtitle': 'Mastery Level',
            'emoji': '🧠',
            'lessonCount': 5,
            'requiredXp': 200,
          },
          {
            'world': 4,
            'title': displayTag('strategic_influence'),
            'subtitle': 'Expert Level',
            'emoji': '👑',
            'lessonCount': 5,
            'requiredXp': 300,
          },
        ];
      default:
        return [];
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'charisma':
        return Icons.favorite;
      case 'defense':
        return Icons.shield;
      case 'psychology':
        return Icons.psychology;
      case 'strategy':
        return Icons.military_tech;
      default:
        return Icons.school;
    }
  }

  String _getCategoryDescription(String category) {
    switch (category) {
      case 'charisma':
        return 'Master the art of recognizing and defending against seductive manipulation tactics';
      case 'defense':
        return 'Build psychological armor against all forms of manipulation';
      case 'psychology':
        return 'Understand the psychology behind manipulation and mind games';
      case 'strategy':
        return 'Learn strategic thinking to navigate power dynamics';
      default:
        return 'Training category';
    }
  }

  void _navigateToWorld(BuildContext context, String category, int world) {
    context.push('/lesson/$category/$world');
  }
}
