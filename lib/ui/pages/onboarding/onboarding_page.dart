import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'beguile_onboarding.dart';

// Simple wrapper for the actual onboarding implementation
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BeguileOnboarding(
      onFinish: () {
        // After onboarding, go to proper login
        context.go('/login');
      },
    );
  }
}
