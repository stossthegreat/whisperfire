import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme.dart';
import '../../../data/models/profile_models.dart';
import '../../../data/services/cache_service.dart';
import '../../../data/services/whisperfire_services.dart';
import '../../../data/services/constants.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';

// ===== PROVIDERS =====
final userProfileProvider = StateNotifierProvider<UserProfileNotifier, UserProfile?>((ref) {
  return UserProfileNotifier();
});

// ===== STATE NOTIFIERS =====
class UserProfileNotifier extends StateNotifier<UserProfile?> {
  UserProfileNotifier() : super(null) {
    _loadProfile();
  }

  void _loadProfile() {
    final profile = CacheService.getProfile();
    if (profile != null) {
      state = profile;
    } else {
      // Use mock data for development
      state = MockData.mockUser;
      _saveProfile();
    }
  }

  void updateChosenMentor(String mentorId) {
    if (state != null) {
      state = UserProfile(
        userId: state!.userId,
        username: state!.username,
        powerRank: state!.powerRank,
        level: state!.level,
        xp: state!.xp,
        nextLevelXp: state!.nextLevelXp,
        chosenMentor: mentorId,
        goals: state!.goals,
        stats: state!.stats,
        achievements: state!.achievements,
        dailyStreak: state!.dailyStreak,
        completedLessons: state!.completedLessons,
        unlockedWorlds: state!.unlockedWorlds,
        savedTactics: state!.savedTactics,
      );
      _saveProfile();
    }
  }

  void updateStats(ProfileStats newStats) {
    if (state != null) {
      state = UserProfile(
        userId: state!.userId,
        username: state!.username,
        powerRank: state!.powerRank,
        level: state!.level,
        xp: state!.xp,
        nextLevelXp: state!.nextLevelXp,
        chosenMentor: state!.chosenMentor,
        goals: state!.goals,
        stats: newStats,
        achievements: state!.achievements,
        dailyStreak: state!.dailyStreak,
        completedLessons: state!.completedLessons,
        unlockedWorlds: state!.unlockedWorlds,
        savedTactics: state!.savedTactics,
      );
      _saveProfile();
    }
  }

  void addXP(int points) {
    if (state != null) {
      final newXP = state!.xp + points;
      int newLevel = state!.level;
      int nextLevelXP = state!.nextLevelXp;

      // Simple leveling system
      while (newXP >= nextLevelXP) {
        newLevel++;
        nextLevelXP += 500; // Each level requires 500 more XP
      }

      state = UserProfile(
        userId: state!.userId,
        username: state!.username,
        powerRank: _getRankForLevel(newLevel),
        level: newLevel,
        xp: newXP,
        nextLevelXp: nextLevelXP,
        chosenMentor: state!.chosenMentor,
        goals: state!.goals,
        stats: state!.stats,
        achievements: state!.achievements,
        dailyStreak: state!.dailyStreak,
        completedLessons: state!.completedLessons,
        unlockedWorlds: state!.unlockedWorlds,
        savedTactics: state!.savedTactics,
      );
      _saveProfile();
    }
  }

  void _saveProfile() {
    if (state != null) {
      CacheService.saveProfile(state!);
    }
  }

  String _getRankForLevel(int level) {
    if (level >= 20) return 'Master Defender';
    if (level >= 15) return 'Elite Guardian';
    if (level >= 10) return 'Guardian';
    if (level >= 5) return 'Defender';
    return 'Trainee';
  }
}

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> with TickerProviderStateMixin {
  late AnimationController _statsAnimationController;
  late Animation<double> _statsAnimation;
  bool _showMentorSelector = false;

  @override
  void initState() {
    super.initState();
    _statsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _statsAnimation = CurvedAnimation(
      parent: _statsAnimationController,
      curve: Curves.easeOutCubic,
    );
    
    // Trigger animation after a short delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _statsAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _statsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(userProfileProvider);
    
    if (profile == null) {
      return const Scaffold(
        backgroundColor: WFColors.base,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(WFColors.purple400),
          ),
        ),
      );
    }

    final selectedMentor = MentorConstants.getMentorById(profile.chosenMentor);
    final mentorGradient = selectedMentor != null 
        ? LinearGradient(
            colors: selectedMentor.color.map((c) => Color(int.parse(c.replaceFirst('#', '0xFF')))).toList(),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : WFGradients.purpleGradient;

    return Scaffold(
      backgroundColor: WFColors.base,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Column(
            children: [
              // Header with avatar
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _showMentorSelector = !_showMentorSelector),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: mentorGradient,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: WFShadows.purpleGlow,
                          border: Border.all(color: WFColors.glassBorder, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            selectedMentor?.avatar ?? '🛡️',
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: WFDims.spacingM),
                    Text(profile.username, style: WFTextStyles.h1),
                    const SizedBox(height: 4),
                    Text(
                      '${profile.powerRank} • Level ${profile.level}',
                      style: WFTextStyles.h4.copyWith(color: WFColors.purple400),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Mentored by ${selectedMentor?.name ?? 'Unknown'}',
                      style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary),
                    ),
                    const SizedBox(height: WFDims.spacingS),
                    // XP Progress Bar
                    _buildXPProgressBar(profile),
                  ],
                ),
              ),
              
              if (_showMentorSelector) ...[
                const SizedBox(height: WFDims.spacingL),
                _buildMentorSelector(profile),
              ],
              
              const SizedBox(height: WFDims.spacingXXL),
              
              // Defense stats
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shield, size: WFDims.iconM, color: WFColors.purple400),
                        const SizedBox(width: WFDims.spacingS),
                        Text('Defense Capabilities', style: WFTextStyles.h3),
                        const Spacer(),
                        Text(
                          'Avg: ${_calculateAverageStats(profile.stats)}%',
                          style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
                        ),
                      ],
                    ),
                    const SizedBox(height: WFDims.spacingL),
                    AnimatedBuilder(
                      animation: _statsAnimation,
                      builder: (context, child) {
                        return Column(
                          children: [
                            MetricBar(
                              label: 'Recognition',
                              value: (profile.stats.recognition * _statsAnimation.value).round(),
                              color: WFColors.tealPurple[0],
                              animate: false,
                            ),
                            const SizedBox(height: WFDims.spacingM),
                            MetricBar(
                              label: 'Resistance',
                              value: (profile.stats.resistance * _statsAnimation.value).round(),
                              color: WFColors.tealPurple[1],
                              animate: false,
                            ),
                            const SizedBox(height: WFDims.spacingM),
                            MetricBar(
                              label: 'Awareness',
                              value: (profile.stats.awareness * _statsAnimation.value).round(),
                              color: WFColors.purple400,
                              animate: false,
                            ),
                            const SizedBox(height: WFDims.spacingM),
                            MetricBar(
                              label: 'Counterplay',
                              value: (profile.stats.counterplay * _statsAnimation.value).round(),
                              color: const Color(0xFF3B82F6),
                              animate: false,
                            ),
                            const SizedBox(height: WFDims.spacingM),
                            MetricBar(
                              label: 'Intuition',
                              value: (profile.stats.intuition * _statsAnimation.value).round(),
                              color: const Color(0xFF10B981),
                              animate: false,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Progress overview
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      '${profile.completedLessons}',
                      'Lessons Mastered',
                      Icons.school,
                      WFColors.tealPurple[0],
                    ),
                  ),
                  const SizedBox(width: WFDims.spacingM),
                  Expanded(
                    child: _buildStatCard(
                      '${profile.unlockedWorlds.length}',
                      'Worlds Unlocked',
                      Icons.public,
                      WFColors.purple400,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      '${profile.dailyStreak}',
                      'Day Streak',
                      Icons.local_fire_department,
                      WFColors.redPink[0],
                    ),
                  ),
                  const SizedBox(width: WFDims.spacingM),
                  Expanded(
                    child: _buildStatCard(
                      '${profile.savedTactics}',
                      'Saved Scripts',
                      Icons.bookmark,
                      const Color(0xFF10B981),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Achievements section
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.emoji_events, size: WFDims.iconM, color: WFColors.purple400),
                        const SizedBox(width: WFDims.spacingS),
                        Text('Recent Achievements', style: WFTextStyles.h3),
                      ],
                    ),
                    const SizedBox(height: WFDims.spacingL),
                    ...profile.achievements.map((achievement) => Padding(
                      padding: const EdgeInsets.only(bottom: WFDims.spacingS),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: WFGradients.purpleGradient,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(Icons.star, size: 16, color: WFColors.textPrimary),
                          ),
                          const SizedBox(width: WFDims.spacingM),
                          Expanded(
                            child: Text(achievement, style: WFTextStyles.bodyMedium),
                          ),
                        ],
                      ),
                    )).toList(),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Quick Actions
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quick Actions', style: WFTextStyles.h3),
                    const SizedBox(height: WFDims.spacingL),
                    _buildQuickAction(
                      'Go to Settings',
                      'Configure your defense system preferences',
                      Icons.settings,
                      () => context.go('/settings'),
                    ),
                    const SizedBox(height: WFDims.spacingM),
                    _buildQuickAction(
                      'View Session History',
                      'Review your past analysis and mentor sessions',
                      Icons.history,
                      () => _showHistory(context),
                    ),
                    const SizedBox(height: WFDims.spacingM),
                    _buildQuickAction(
                      'Export Profile Data',
                      'Download your progress and achievements',
                      Icons.download,
                      () => _exportProfile(context),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingXXL),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildXPProgressBar(UserProfile profile) {
    final currentLevelXP = profile.xp - (profile.level - 1) * 500; // Simplified calculation
    final nextLevelXP = 500; // XP needed for next level
    final progress = (currentLevelXP / nextLevelXP).clamp(0.0, 1.0);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('XP: ${profile.xp}', style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
            Text('Next: ${profile.nextLevelXp}', style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          width: 200,
          height: 8,
          decoration: BoxDecoration(
            color: WFColors.gray700,
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: WFGradients.tealPurple,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMentorSelector(UserProfile profile) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Your Mentor', style: WFTextStyles.h3),
          const SizedBox(height: WFDims.spacingL),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: WFDims.spacingM,
            crossAxisSpacing: WFDims.spacingM,
            childAspectRatio: 1,
            children: MentorConstants.mentors.map((mentor) {
              final isSelected = mentor.id == profile.chosenMentor;
              final gradient = LinearGradient(
                colors: mentor.color.map((c) => Color(int.parse(c.replaceFirst('#', '0xFF')))).toList(),
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              );

              return GestureDetector(
                onTap: () {
                  ref.read(userProfileProvider.notifier).updateChosenMentor(mentor.id);
                  setState(() => _showMentorSelector = false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                    border: isSelected 
                        ? Border.all(color: WFColors.textPrimary, width: 2)
                        : null,
                    boxShadow: isSelected ? WFShadows.purpleGlow : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(mentor.avatar, style: const TextStyle(fontSize: 24)),
                      const SizedBox(height: 4),
                      Text(
                        mentor.name.split(' ').first, // First name only
                        style: WFTextStyles.bodySmall.copyWith(
                          color: WFColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return GlassCard(
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(height: WFDims.spacingS),
          Text(value, style: WFTextStyles.h2.copyWith(color: color)),
          const SizedBox(height: 4),
          Text(
            label,
            style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: WFColors.purple500.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 20, color: WFColors.purple400),
          ),
          const SizedBox(width: WFDims.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: WFTextStyles.labelLarge),
                const SizedBox(height: 2),
                Text(subtitle, style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, size: WFDims.iconM, color: WFColors.gray500),
        ],
      ),
    );
  }

  int _calculateAverageStats(ProfileStats stats) {
    return ((stats.recognition + stats.resistance + stats.awareness + stats.counterplay + stats.intuition) / 5).round();
  }

  void _showHistory(BuildContext context) {
    final history = CacheService.getRecentHistory();
    
    showModalBottomSheet(
      context: context,
      backgroundColor: WFColors.gray900,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: WFColors.gray600,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: WFDims.spacingL),
              Text('Session History', style: WFTextStyles.h2),
              const SizedBox(height: WFDims.spacingL),
              Expanded(
                child: history.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.history, size: 48, color: WFColors.textMuted),
                            const SizedBox(height: WFDims.spacingM),
                            Text(
                              'No session history yet',
                              style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textMuted),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          final session = history[index];
                          final timestamp = DateTime.tryParse(session['timestamp'] ?? '') ?? DateTime.now();
                          final type = session['type'] as String? ?? 'unknown';
                          
                          return Padding(
                            padding: const EdgeInsets.only(bottom: WFDims.spacingM),
                            child: GlassCard(
                              padding: const EdgeInsets.all(WFDims.paddingM),
                              child: Row(
                                children: [
                                  Icon(
                                    type == 'analysis' ? Icons.visibility : Icons.psychology,
                                    color: WFColors.purple400,
                                  ),
                                  const SizedBox(width: WFDims.spacingM),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          type == 'analysis' ? 'Analysis Session' : 'Mentor Session',
                                          style: WFTextStyles.labelLarge,
                                        ),
                                        Text(
                                          _formatTimestamp(timestamp),
                                          style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _exportProfile(BuildContext context) {
    // Placeholder for profile export functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile export functionality coming soon', style: WFTextStyles.bodySmall),
        backgroundColor: WFColors.purple600,
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);
    
    if (diff.inDays > 0) {
      return '${diff.inDays} days ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} hours ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}

// ===== UPDATED MOCK DATA =====
extension MockDataProfile on MockData {
  static const UserProfile enhancedMockUser = UserProfile(
    userId: 'defender_001',
    username: 'ShadowDefender',
    powerRank: 'Guardian',
    level: 7,
    xp: 2450,
    nextLevelXp: 3000,
    chosenMentor: 'sun_tzu',
    goals: ['manipulation_defense', 'influence_awareness'],
    stats: ProfileStats(
      recognition: 78,
      resistance: 65,
      awareness: 88,
      counterplay: 42,
      intuition: 71,
    ),
    achievements: [
      'First Defense Master',
      'Pattern Recognition Expert', 
      'Counter-Strike Specialist',
      'Seven Day Streak Champion',
      'Mentor Collaboration Expert'
    ],
    dailyStreak: 12,
    completedLessons: 23,
    unlockedWorlds: ['seductive_gravity', 'frame_control'],
    savedTactics: 15,
  );
}

// ===== GLOBAL STATE ACCESS =====
// Helper extension to access providers from anywhere
extension ProviderAccess on WidgetRef {
  UserProfile? get currentProfile => read(userProfileProvider);
} 