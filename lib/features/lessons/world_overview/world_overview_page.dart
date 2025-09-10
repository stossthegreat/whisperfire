import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/taxonomy/tag_registry.dart';
import '../../../data/providers.dart';
import '../../../data/models/lesson_models.dart';
import '../../../data/models/profile_models.dart';
import '../../../data/services/gating_service.dart';
import '../lesson_player/lesson_player_page.dart';

class WorldOverviewPage extends ConsumerWidget {
  final String category;

  const WorldOverviewPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WorldOverviewPage.build called with category: $category

    final categoryName = _getCategoryDisplayName(category);
    final color = _getCategoryColor(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: color),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your World',
              style: GoogleFonts.playfairDisplay(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Each world contains advanced lessons',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  final world = index + 1;
                  return _buildWorldCard(context, ref, world, color);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorldCard(BuildContext context, WidgetRef ref, int world, Color color) {
    return Consumer(
      builder: (context, ref, child) {
        // _buildWorldCard called with category: $category, world: $world

        final lessonsFuture = ref.watch(worldLessonsProvider((category, world)));
        final profileAsync = ref.watch(userProfileProvider);

        return lessonsFuture.when(
          data: (lessons) {
            final lessonCount = lessons.length;

            return profileAsync.when(
              data: (profile) {
                final isUnlocked = GatingService.isWorldUnlocked(profile, category, world);

                final card = Container(
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    color.withOpacity(0.02),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: color.withOpacity(0.15),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 40,
                    offset: const Offset(0, 16),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                      onTap: isUnlocked ? () => _showWorldLessons(context, ref, world, lessons) : null,
                      child: Stack(
                        children: [
                          Padding(
                    padding: const EdgeInsets.all(24),
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
                                Icons.public,
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
                                    'World $world',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '$lessonCount lessons',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                        if (lessonCount == 0) ...[
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.hourglass_empty,
                                  color: Colors.grey[400],
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'World is waiting. Lessons will appear here.',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                          ),
                          if (!isUnlocked)
                            Positioned(
                              right: 16,
                              top: 16,
                              child: Icon(Icons.lock, color: color.withOpacity(0.8)),
                            ),
                        ],
                  ),
                ),
              ),
            );

                return Opacity(opacity: isUnlocked ? 1.0 : 0.6, child: card);
              },
              loading: () => _loadingCard(color),
              error: (_, __) => _errorCard(color),
            );
          },
          loading: () => _loadingCard(color),
          error: (error, stack) => _errorCard(color),
        );
      },
    );
  }

  Widget _loadingCard(Color color) => Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(24),
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
            child: const Center(child: CircularProgressIndicator()),
      );

  Widget _errorCard(Color color) => Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(24),
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
        child: const Text('Error'),
    );

  void _showWorldLessons(
      BuildContext context, WidgetRef ref, int world, List<Lesson> lessons) {
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
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'World $world Lessons',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: lessons.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.school_outlined,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No lessons available yet',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: lessons.length,
                      itemBuilder: (context, index) {
                        final lesson = lessons[index];
                        return _buildLessonTile(context, ref, lesson);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonTile(BuildContext context, WidgetRef ref, Lesson lesson) {
    final profile = ref.watch(userProfileProvider).maybeWhen(
          data: (p) => p,
          orElse: () => null,
        );
    final isUnlocked = profile != null && GatingService.isLessonUnlocked(profile, lesson);

    return Opacity(
      opacity: isUnlocked ? 1.0 : 0.5,
      child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            _getCategoryColor(category).withOpacity(0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _getCategoryColor(category).withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: _getCategoryColor(category).withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 24,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
            onTap: isUnlocked
                ? () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LessonPlayerPage(
                  category: lesson.category,
                  world: lesson.world,
                  lesson: lesson.lesson,
                ),
              ),
            );
                  }
                : null,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(category).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _getCategoryColor(category).withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          '${lesson.xp} XP',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: _getCategoryColor(category),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(category).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _getCategoryColor(category).withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                      isUnlocked ? Icons.play_circle_outline : Icons.lock,
                    color: _getCategoryColor(category),
                    size: 24,
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getCategoryDisplayName(String category) {
    return displayTag(category);
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'magnetic_presence':
        return const Color(0xFFE91E63);
      case 'composed_authority':
        return const Color(0xFF26A69A);
      case 'conversation_frames':
        return const Color(0xFF3F51B5);
      case 'scarcity_desire':
        return const Color(0xFFFF9800);
      case 'hidden_dynamics':
        return const Color(0xFF9C27B0);
      case 'strategic_influence':
        return const Color(0xFF4CAF50);
      default:
        return Colors.purple;
    }
  }
}
