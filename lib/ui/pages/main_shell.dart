import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/theme.dart';
import '../../data/providers.dart';
import '../../ui/pages/onboarding/beguile_onboarding.dart';
import '../shared/loading_shell.dart';

class MainShell extends ConsumerWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    return profileAsync.when(
      data: (profile) {
        // Check if user has seen onboarding
        if (!profile.hasSeenOnboarding) {
          return BeguileOnboarding(
            onFinish: () {
              // Mark onboarding as complete and refresh profile
              profile.hasSeenOnboarding = true;
              ref.read(profileRepoProvider).saveProfile(profile);
              ref.invalidate(userProfileProvider);
            },
          );
        }

        // Show main app if onboarding is complete
        return Scaffold(
          backgroundColor: WFColors.base,
          body: child,
          bottomNavigationBar: _BottomNavBar(),
        );
      },
      loading: () => const LoadingShell(),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Text('Error loading profile: $error'),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    // Determine active tab index
    int selectedIndex = 0;
    switch (currentLocation) {
      case '/lessons':
        selectedIndex = 0;
        break;
      case '/mentors':
        selectedIndex = 1;
        break;
      case '/analyze':
        selectedIndex = 2;
        break;
      case '/profile':
        selectedIndex = 3;
        break;
      case '/settings':
        selectedIndex = 4;
        break;
    }

    return Container(
      height: WFDims.bottomNavHeight,
      decoration: BoxDecoration(
        color: WFColors.gray900.withOpacity(0.95),
        border: Border(
            top: BorderSide(
                color: WFColors.gray700.withOpacity(0.5),
                width: WFDims.borderThin)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: WFDims.paddingS, vertical: WFDims.paddingS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                  icon: Icons.school_outlined,
                  activeIcon: Icons.school,
                  label: 'Lessons',
                  isActive: selectedIndex == 0,
                  onTap: () => context.go('/lessons')),
              _NavItem(
                  icon: Icons.psychology_outlined,
                  activeIcon: Icons.psychology,
                  label: 'Mentors',
                  isActive: selectedIndex == 1,
                  onTap: () => context.go('/mentors')),
              _NavItem(
                  icon: Icons.visibility_outlined,
                  activeIcon: Icons.visibility,
                  label: 'Analyze',
                  isActive: selectedIndex == 2,
                  onTap: () => context.go('/analyze')),
              _NavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: 'Profile',
                  isActive: selectedIndex == 3,
                  onTap: () => context.go('/profile')),
              _NavItem(
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                  label: 'Settings',
                  isActive: selectedIndex == 4,
                  onTap: () => context.go('/settings')),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon, activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem(
      {required this.icon,
      required this.activeIcon,
      required this.label,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: WFDims.paddingS, vertical: WFDims.paddingS),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
          color: isActive ? WFColors.purple500.withOpacity(0.1) : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isActive ? activeIcon : icon,
                size: WFDims.iconM,
                color: isActive ? WFColors.purple400 : WFColors.gray500),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isActive ? WFColors.purple400 : WFColors.gray500)),
          ],
        ),
      ),
    );
  }
}
