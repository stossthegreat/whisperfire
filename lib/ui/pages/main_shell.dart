import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/providers.dart';
import '../../data/providers/auth_providers.dart';
import '../../core/theme/theme.dart';
import '../shared/loading_shell.dart';
import 'onboarding/onboarding_page.dart';

class MainShell extends ConsumerWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);
    final authState = ref.watch(authStateProvider);

    return profileAsync.when(
      data: (profile) {
        // Check if user has seen onboarding
        if (!profile.hasSeenOnboarding) {
          return const OnboardingPage();
        }

        // Return main shell with bottom navigation
        return _MainShellContent(child: child);
      },
      loading: () => const LoadingShell(),
      error: (error, stack) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: WFColors.error),
                const SizedBox(height: 16),
                Text(
                  'Error loading profile',
                  style: WFTextStyles.h3.copyWith(color: WFColors.error),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MainShellContent extends StatelessWidget {
  final Widget child;

  const _MainShellContent({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WFColors.base,
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: WFColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: WFColors.primary,
          unselectedItemColor: WFColors.textSecondary,
          currentIndex: _getCurrentIndex(context),
          onTap: (index) => _onItemTapped(context, index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Lessons',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.psychology),
              label: 'Mentors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.visibility),
              label: 'Analyze',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/lessons')) return 0;
    if (location.startsWith('/mentors')) return 1;
    if (location.startsWith('/analyze')) return 2;
    if (location.startsWith('/profile')) return 3;
    if (location.startsWith('/settings')) return 4;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed('lessons');
        break;
      case 1:
        context.goNamed('mentors');
        break;
      case 2:
        context.goNamed('analyze');
        break;
      case 3:
        context.goNamed('profile');
        break;
      case 4:
        context.goNamed('settings');
        break;
    }
  }
}
