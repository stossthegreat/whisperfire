import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../ui/pages/main_shell.dart';
import '../../ui/pages/lessons/lessons_page.dart';
import '../../ui/pages/mentors/mentors_page.dart';
import '../../ui/pages/analyze/analyze_page.dart';
import '../../ui/pages/profile/profile_page.dart';
import '../../ui/pages/settings/settings_page.dart';
import '../../ui/pages/mentors/mentor_detail_page.dart';
import '../../features/lessons/lesson_player/lesson_player_page.dart';
import '../../features/lessons/world_overview/world_overview_page.dart';
import '../../ui/pages/onboarding/beguile_onboarding.dart';
import '../../data/services/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../content/lessons_catalog.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/lessons',
    routes: [
      // Onboarding route (outside shell)
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => BeguileOnboarding(
          onFinish: () {
            // Mark onboarding as complete and navigate to main app
            context.go('/lessons');
          },
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/lessons',
            name: 'lessons',
            builder: (context, state) => const LessonsPage(),
          ),
          GoRoute(
            path: '/lesson/:category/:world',
            name: 'lessonWorld',
            builder: (context, state) {
              final category = state.pathParameters['category']!;
              return WorldOverviewPage(category: category);
            },
          ),
          GoRoute(
            path: '/lesson/:category/:world/:lesson',
            name: 'lessonPlayer',
            builder: (context, state) {
              final category = state.pathParameters['category']!;
              final world = int.parse(state.pathParameters['world']!);
              final lesson = int.parse(state.pathParameters['lesson']!);

              // Validate category
              if (!kCategories.contains(category)) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Invalid category: $category',
                      style: GoogleFonts.inter(fontSize: 18),
                    ),
                  ),
                );
              }

              // Validate world
              if (world < 1 || world > 4) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      'Invalid world: $world',
                      style: GoogleFonts.inter(fontSize: 18),
                    ),
                  ),
                );
              }

              return LessonPlayerPage(
                category: category,
                world: world,
                lesson: lesson,
              );
            },
          ),
          GoRoute(
            path: '/mentors',
            name: 'mentors',
            builder: (context, state) => const MentorsPage(),
          ),
          GoRoute(
            path: '/mentor/:mentorId',
            name: 'mentorDetail',
            builder: (context, state) {
              final mentorId = state
                  .pathParameters['mentorId']!; // Fixed: use pathParameters
              final mentor =
                  MentorConstants.getMentorById(mentorId); // Get mentor object

              // Fallback to first mentor if not found
              final selectedMentor = mentor ?? MentorConstants.mentors.first;

              return MentorDetailPage(
                  mentor: selectedMentor); // Fixed: pass Mentor object
            },
          ),
          GoRoute(
            path: '/analyze',
            name: 'analyze',
            builder: (context, state) => const AnalyzePage(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
}
