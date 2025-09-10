import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'beguile_onboarding.dart';
import '../../../data/services/onboarding_service.dart';

// Simple wrapper for the actual onboarding implementation
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BeguileOnboarding(
      onFinish: () async {
        await OnboardingService.complete();
        // After onboarding, go to paywall
        context.go('/paywall');
      },
    );
  }
}
