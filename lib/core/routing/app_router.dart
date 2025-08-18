import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../ui/pages/main_shell.dart';
import '../../ui/pages/lessons/lessons_page.dart';
import '../../ui/pages/mentors/mentors_page.dart';
import '../../ui/pages/analyze/analyze_page.dart';
import '../../ui/pages/profile/profile_page.dart';
import '../../ui/pages/settings/settings_page.dart';
import '../../ui/pages/mentors/mentor_detail_page.dart';
import '../../data/services/constants.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/lessons',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/lessons',
            name: 'lessons',
            builder: (context, state) => const LessonsPage(),
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
              final mentorId = state.pathParameters['mentorId']!; // Fixed: use pathParameters
              final mentor = MentorConstants.getMentorById(mentorId); // Get mentor object
              
              // Fallback to first mentor if not found
              final selectedMentor = mentor ?? MentorConstants.mentors.first;
              
              return MentorDetailPage(mentor: selectedMentor); // Fixed: pass Mentor object
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