import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/providers/auth_providers.dart';
import '../../ui/pages/main_shell.dart';
import '../../ui/pages/lessons/lessons_page.dart';
import '../../ui/pages/mentors/mentors_page.dart';
import '../../ui/pages/analyze/analyze_page.dart';
import '../../ui/pages/profile/profile_page.dart';
import '../../ui/pages/settings/settings_page.dart';
import '../../ui/pages/onboarding/onboarding_page.dart';
import '../../ui/pages/auth/login_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final container = ProviderScope.containerOf(context);
      final authState = container.read(authStateProvider);

      if (authState == AuthState.loading) return null;

      final isOnLogin = state.matchedLocation == '/login';
      final isOnOnboarding = state.matchedLocation == '/onboarding';

      if (authState == AuthState.unauthenticated && !isOnLogin && !isOnOnboarding) {
        return '/login';
      }
      if (authState == AuthState.authenticated && (isOnLogin || isOnOnboarding || state.matchedLocation == '/')) {
        return '/lessons';
      }
      return null;
    },
    routes: [
      // Login route (outside shell)
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      // Onboarding route (outside shell)
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      // Main shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
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
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
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
        ],
      ),
    ],
  );
});
