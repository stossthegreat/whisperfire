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

      final location = state.matchedLocation;
      final isOnLogin = location == '/login';
      final isOnOnboarding = location == '/onboarding';
      final isOnRootOrHome = location == '/' || location == '/home';

      // If we're on root/home, immediately route based on auth state to avoid blank screen
      if (isOnRootOrHome) {
        if (authState == AuthState.authenticated) return '/lessons';
        // Treat loading same as unauthenticated for initial UX
        return '/onboarding';
      }

      // Unauthenticated: show onboarding first; allow /login and /onboarding
      if (authState == AuthState.unauthenticated) {
        if (!isOnOnboarding && !isOnLogin) return '/onboarding';
        return null;
      }

      // Authenticated: send to lessons from login/onboarding
      if (authState == AuthState.authenticated && (isOnLogin || isOnOnboarding)) {
        return '/lessons';
      }
      return null;
    },
    routes: [
      // Root alias (prevents 404 on initial load when state is still resolving)
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const SizedBox.shrink(),
      ),
      // Alias: /home (no UI, just a path that gets redirected in redirect())
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const SizedBox.shrink(),
      ),

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
