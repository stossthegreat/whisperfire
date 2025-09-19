import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';

class BeguileOnboarding extends ConsumerStatefulWidget {
  final VoidCallback onFinish;
  const BeguileOnboarding({super.key, required this.onFinish});

  @override
  ConsumerState<BeguileOnboarding> createState() => _BeguileOnboardingState();
}

class _BeguileOnboardingState extends ConsumerState<BeguileOnboarding>
    with TickerProviderStateMixin {
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const _WelcomeSlide(),
      const _LessonsSlide(),
      const _MentorsSlide(),
      const _AnalyzeSlide(),
      const _PowerSlide(),
      _FinishSlide(onContinue: widget.onFinish),
    ];

    return Scaffold(
      backgroundColor: WFColors.base,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (_, i) => pages[i],
            ),

            // Bottom navigation dots and controls
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: IgnorePointer(
                ignoring: true,
              child: Row(
                children: [
                  _PageDots(count: pages.length, index: _page),
                  const Spacer(),
                  _BrandedFooter(),
                  const SizedBox(width: 8),
                ],
                ),
              ),
            ),

            // Next button (skip on last)
            if (_page < pages.length - 1)
              Positioned(
                right: 16,
                bottom: 88,
                child: _GhostButton(
                  label: 'Next',
                  onTap: () => _controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/* ------------------ THE INITIATION TOUR SLIDES ------------------ */

class _WelcomeSlide extends StatelessWidget {
  const _WelcomeSlide();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.8,
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Welcome text
              Text(
                'Welcome to',
                style: WFTextStyles.h2.copyWith(
                  color: WFColors.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // App name with gradient
              ShaderMask(
                shaderCallback: (bounds) =>
                    WFGradients.purpleGradient.createShader(bounds),
                child: Text(
                  'BEGUILE AI',
                  style: WFTextStyles.h1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                    fontSize: screenWidth * 0.08,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Tagline
              Text(
                'Where desire becomes strategy.',
                style: WFTextStyles.h3.copyWith(
                  color: WFColors.purple400,
                  fontWeight: FontWeight.w700,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Legendary description
              Text(
                'You\'ve been chosen to step into the circle. Learn to hold the frame, ignite tension, and speak in lines that live rent-free in their minds forever.',
                style: WFTextStyles.bodyLarge.copyWith(
                  color: WFColors.gray300,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Warning element
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.amber,
                      size: screenWidth * 0.06,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: Text(
                        'Master the art of communication through advanced social psychology and strategic thinking.',
                        style: TextStyle(
                          color: Colors.amber[200],
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonsSlide extends StatelessWidget {
  const _LessonsSlide();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.8,
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Title
              Text(
                'THE DOJO',
                style: WFTextStyles.h1.copyWith(
                  color: WFColors.purple400,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  fontSize: screenWidth * 0.08,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // Subtitle
              Text(
                'Where legends are forged',
                style: WFTextStyles.h3.copyWith(
                  color: WFColors.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // App screenshot
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: WFColors.purple400.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/onboarding/lessons_screenshot.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: WFColors.gray800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Legendary explanation
              Text(
                'Behind these doors lie 120+ lessons across 6 legendary categories. Each world unlocks new levels of mastery. You start as a student. You\'ll leave as a master.',
                style: WFTextStyles.bodyLarge.copyWith(
                  color: WFColors.gray300,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class _MentorsSlide extends StatelessWidget {
  const _MentorsSlide();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.8,
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Title
              Text(
                'THE COUNCIL',
                style: WFTextStyles.h1.copyWith(
                  color: WFColors.purple400,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  fontSize: screenWidth * 0.08,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // Subtitle
              Text(
                'Ancient wisdom at your fingertips',
                style: WFTextStyles.h3.copyWith(
                  color: WFColors.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // App screenshot
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: WFColors.purple400.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/onboarding/mentors_screenshot.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: WFColors.gray800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Legendary explanation
              Text(
                'Six legendary mentors await your questions. Casanova teaches charm defense. Cleopatra reveals power plays. Machiavelli exposes cunning. Each AI mentor is a master of their domain.',
                style: WFTextStyles.bodyLarge.copyWith(
                  color: WFColors.gray300,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnalyzeSlide extends StatelessWidget {
  const _AnalyzeSlide();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.8,
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Title
              Text(
                'THE SCANNER',
                style: WFTextStyles.h1.copyWith(
                  color: WFColors.purple400,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  fontSize: screenWidth * 0.08,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // Subtitle
              Text(
                'See through every facade',
                style: WFTextStyles.h3.copyWith(
                  color: WFColors.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // App screenshot
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: WFColors.purple400.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/onboarding/analyze_screenshot.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: WFColors.gray800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Legendary explanation
              Text(
                'Upload any message and our AI reveals the hidden psychology. Spot manipulation tactics. Understand power dynamics. See through every facade with surgical precision.',
                style: WFTextStyles.bodyLarge.copyWith(
                  color: WFColors.gray300,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class _PowerSlide extends StatelessWidget {
  const _PowerSlide();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.8,
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // Title
              Text(
                'THE POWER',
                style: WFTextStyles.h1.copyWith(
                  color: WFColors.purple400,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  fontSize: screenWidth * 0.08,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // Subtitle
              Text(
                'Knowledge is your weapon',
                style: WFTextStyles.h3.copyWith(
                  color: WFColors.gray400,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // App screenshot
              Container(
                width: double.infinity,
                height: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: WFColors.purple400.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'assets/images/onboarding/power_screenshot.png',
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: WFColors.gray800,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flash_on,
                            size: screenWidth * 0.12,
                            color: WFColors.purple400,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'POWER SCREENSHOT',
                            style: WFTextStyles.bodyMedium.copyWith(
                              color: WFColors.gray400,
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Add power_screenshot.png to assets',
                            style: WFTextStyles.bodySmall.copyWith(
                              color: WFColors.gray500,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Legendary explanation
              Text(
                'This knowledge is dangerous. It gives you the power to see through manipulation, control social dynamics, and command respect. Use it wisely. Use it well.',
                style: WFTextStyles.bodyLarge.copyWith(
                  color: WFColors.gray300,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpSlide extends ConsumerStatefulWidget {
  final VoidCallback onFinish;
  const _SignUpSlide({required this.onFinish});

  @override
  ConsumerState<_SignUpSlide> createState() => _SignUpSlideState();
}

class _SignUpSlideState extends ConsumerState<_SignUpSlide> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _agreeTerms = false;
  bool _agreePrivacy = false;
  bool get _canContinue => true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _openSheet(String title, String body) {
    showModalBottomSheet(
      context: context,
      backgroundColor: WFColors.base,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: WFTextStyles.h2.copyWith(
                  color: WFColors.purple400,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                body,
                style: WFTextStyles.bodyMedium.copyWith(
                  color: WFColors.gray300,
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: TextStyle(color: WFColors.purple400),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitPremium() {
    widget.onFinish();
  }

  void _submitFree() {
    widget.onFinish();
  }

  @override
  Widget build(BuildContext context) {
    return _CinemaFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            'YOU\'RE READY',
            style: WFTextStyles.h1.copyWith(
              color: WFColors.purple400,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Let\'s continue to sign in.',
            style: WFTextStyles.h3.copyWith(
              color: WFColors.gray400,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          _CTAButton(
            label: 'Continue',
            enabled: true,
            onTap: widget.onFinish,
                  primary: true,
                ),
          const Spacer(),
        ],
      ),
    );
  }
}

/* ------------------ UI COMPONENTS ------------------ */

class _CinemaFrame extends StatelessWidget {
  final Widget child;
  const _CinemaFrame({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [WFColors.base, WFColors.gray900],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final IconData icon;

  const _InputField({
    required this.controller,
    required this.hint,
    this.obscure = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: WFTextStyles.bodyMedium.copyWith(
        color: WFColors.gray200,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: WFTextStyles.bodyMedium.copyWith(
          color: WFColors.gray500,
        ),
        prefixIcon: Icon(
          icon,
          color: WFColors.gray500,
        ),
        filled: true,
        fillColor: WFColors.gray800.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: WFColors.gray700.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: WFColors.purple400,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class _AgreeRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final VoidCallback onTapLink;

  const _AgreeRow({
    required this.value,
    required this.onChanged,
    required this.label,
    required this.onTapLink,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: WFColors.purple400,
          checkColor: WFColors.base,
          side: BorderSide(
            color: WFColors.gray600.withOpacity(0.6),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: onTapLink,
            child: Text(
              label,
              style: WFTextStyles.bodyMedium.copyWith(
                color: WFColors.gray300,
                decoration: TextDecoration.underline,
                decorationColor: WFColors.purple400.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CTAButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onTap;
  final bool primary;

  const _CTAButton({
    required this.label,
    required this.enabled,
    required this.onTap,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bg = primary
        ? (enabled ? WFColors.purple400 : WFColors.gray600)
        : Colors.transparent;
    final fg = primary
        ? WFColors.base
        : (enabled ? WFColors.purple400 : WFColors.gray600);
    final border = primary
        ? null
        : Border.all(
            color: enabled ? WFColors.purple400 : WFColors.gray600,
            width: 2,
          );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
          border: border,
          boxShadow: primary && enabled
              ? [
                  BoxShadow(
                    color: WFColors.purple400.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: WFTextStyles.bodyLarge.copyWith(
            color: fg,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _GhostButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: WFColors.gray800.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: WFColors.gray600.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: WFTextStyles.bodyMedium.copyWith(
            color: WFColors.gray300,
          ),
        ),
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  final int count;
  final int index;

  const _PageDots({required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        count,
        (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(right: 8),
          width: i == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: i == index
                ? WFColors.purple400
                : WFColors.gray600.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class _BrandedFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: WFColors.purple400.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: WFColors.purple400.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome,
            color: WFColors.purple400,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            'Beguile AI',
            style: WFTextStyles.bodySmall.copyWith(
              color: WFColors.purple400,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _FinishSlide extends StatelessWidget {
  final VoidCallback onContinue;
  const _FinishSlide({required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return _CinemaFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            'YOU\'RE READY',
            style: WFTextStyles.h1.copyWith(
              color: WFColors.purple400,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Let\'s set up your account and continue.',
            style: WFTextStyles.h3.copyWith(
              color: WFColors.gray400,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          _CTAButton(
            label: 'Continue',
            enabled: true,
            onTap: onContinue,
            primary: true,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
