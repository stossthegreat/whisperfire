import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart';

import '../../../data/providers.dart';
import '../../../data/models/lesson_models.dart';
import '../../../core/streak/streak_service.dart';
import '../../../data/services/gating_service.dart';
import '../widgets/tts_controls.dart';
import '../widgets/frosted_card.dart';

class LessonPlayerPage extends ConsumerStatefulWidget {
  final String category;
  final int world;
  final int lesson;

  const LessonPlayerPage({
    super.key,
    required this.category,
    required this.world,
    required this.lesson,
  });

  @override
  ConsumerState<LessonPlayerPage> createState() => _LessonPlayerPageState();
}

class _LessonPlayerPageState extends ConsumerState<LessonPlayerPage>
    with TickerProviderStateMixin {
  late Future<Lesson> _lessonFuture;
  late ConfettiController _confettiController;
  late AnimationController _pageController;
  late AnimationController _cardController;

  int _currentStep = 0;
  bool _isCompleting = false; // Flag to prevent multiple completion calls

  // Text controllers for validation
  late TextEditingController _rewriteController;
  late TextEditingController _reflectionController;

  @override
  void initState() {
    super.initState();
    _lessonFuture = ref
        .read(lessonRepoProvider)
        .load(widget.category, widget.world, widget.lesson);
    _confettiController =
        ConfettiController(duration: const Duration(milliseconds: 1200));
    _pageController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _cardController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Initialize text controllers
    _rewriteController = TextEditingController();
    _reflectionController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cardController.forward();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _pageController.dispose();
    _cardController.dispose();
    _rewriteController.dispose();
    _reflectionController.dispose();
    super.dispose();
  }

  void _nextStep() {
    // Validate current step before proceeding
    if (!_canProceedToNextStep()) {
      return;
    }

    if (_currentStep < 5) {
      // Changed from 4 to 5 to handle 6 steps
      setState(() {
        _currentStep++;
      });
      _pageController.forward(from: 0);
    }
  }

  bool _canProceedToNextStep() {
    // Check if user has entered text for rewrite step
    if (_currentStep == 4) {
      // Rewrite step (index 4, was 3)
      if (_rewriteController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter your rewrite before continuing'),
            backgroundColor: Colors.orange,
          ),
        );
        return false;
      }
    }

    // Check if user has entered text for reflection step
    if (_currentStep == 5) {
      // Reflection step (index 5, was 4)
      if (_reflectionController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Please enter your reflection before completing the lesson'),
            backgroundColor: Colors.orange,
          ),
        );
        return false;
      }
    }

    return true;
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.forward(from: 0);
    }
  }

  void _completeLesson(Lesson lesson) async {
    // Validate reflection is filled before completing
    if (_reflectionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Please enter your reflection before completing the lesson'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (!mounted || _isCompleting) return; // Prevent multiple completion calls

    _isCompleting = true; // Set flag to prevent duplicate calls

    _confettiController.play();

    // Award XP
    final userId = ref.read(currentUserIdProvider);
    await ref.read(progressServiceProvider).awardXp(userId, lesson);

    // Update streak
    await StreakService.completeLesson();

    // Invalidate userProfileProvider to refresh all UI components
    ref.invalidate(userProfileProvider);

    // Double-check if still mounted before showing dialog
    if (mounted) {
      // Use a small delay to ensure the XP award is processed
      await Future.delayed(const Duration(milliseconds: 100));

      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) =>
              _buildCompletionDialog(lesson, dialogContext),
        );
      }
    }
  }

  Widget _buildCompletionDialog(Lesson lesson, BuildContext dialogContext) {
    // Compute next lesson using current profile and gating rules
    final profile = ref.read(userProfileProvider).maybeWhen(
          data: (p) => p,
          orElse: () => null,
        );
    final nextLesson = profile != null
        ? GatingService.findNextLessonInCategory(profile, lesson.category)
        : null;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        // Handle back button press
        Navigator.of(dialogContext).pop();
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Lesson Complete!',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You earned ${lesson.xp} XP!',
              style: GoogleFonts.inter(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.purple[600], size: 24),
                  const SizedBox(width: 8),
                  Text(
                    '${lesson.xp} XP',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Close dialog first
              Navigator.of(dialogContext).pop();
              // Reset completion flag
              _isCompleting = false;
              // Navigate back to Lessons tab (root lessons page)
              Future.delayed(const Duration(milliseconds: 100), () {
                if (mounted) {
                  Navigator.of(context).pop(); // pop player
                }
              });
            },
            child: const Text('Back to Lessons'),
          ),
          ElevatedButton(
            onPressed: (nextLesson == null)
                ? null
                : () {
              // Close dialog first
              Navigator.of(dialogContext).pop();
              // Reset completion flag
              _isCompleting = false;
                    // Navigate to the next lesson
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      if (!mounted) return;
                      Navigator.of(context).pop(); // pop current player
                      await Future.delayed(const Duration(milliseconds: 100));
                      if (!mounted) return;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LessonPlayerPage(
                            category: nextLesson.category,
                            world: nextLesson.world,
                            lesson: nextLesson.lesson,
                          ),
                        ),
                      );
              });
            },
            child: const Text('Next Lesson'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Lesson>(
        future: _lessonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load lesson',
                    style: GoogleFonts.inter(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.error.toString(),
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final lesson = snapshot.data!;
          return _buildLessonContent(lesson);
        },
      ),
    );
  }

  Widget _buildLessonContent(Lesson lesson) {
    return CustomScrollView(
      slivers: [
        // Hero header
        SliverAppBar(
          expandedHeight: 200,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _getCategoryColor(lesson.category).withOpacity(0.8),
                    _getCategoryColor(lesson.category).withOpacity(0.6),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  lesson.title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),

        // Lesson content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Step indicator
                _buildStepIndicator(),
                const SizedBox(height: 24),

                // Current step content
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                    );
                  },
                  child: _buildCurrentStep(lesson),
                ),

                const SizedBox(height: 24),

                // Navigation buttons
                _buildNavigationButtons(lesson),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepIndicator() {
    final steps = [
      'Hook',
      'Concept',
      'Teaching',
      'Drill',
      'Rewrite',
      'Reflection'
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: steps.asMap().entries.map((entry) {
        final index = entry.key;
        final step = entry.value;
        final isActive = index == _currentStep;
        final isCompleted = index < _currentStep;

        return Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.green
                    : isActive
                        ? _getCategoryColor(widget.category)
                        : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                isCompleted ? Icons.check : Icons.circle,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              step,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color:
                    isActive ? _getCategoryColor(widget.category) : Colors.grey,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCurrentStep(Lesson lesson) {
    switch (_currentStep) {
      case 0:
        return _buildHookStep(lesson.content);
      case 1:
        return _buildConceptStep(lesson.content);
      case 2:
        return _buildTeachingStep(lesson.content);
      case 3:
        return _buildDrillStep(lesson.content);
      case 4:
        return _buildRewriteStep(lesson.content);
      case 5:
        return _buildReflectionStep(lesson.content);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildHookStep(LessonContent content) {
    return FrostedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Hook',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.hook,
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.6,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          TtsControls(text: content.hook),
        ],
      ),
    );
  }

  Widget _buildConceptStep(LessonContent content) {
    return FrostedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Concepts',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...content.concept.map((concept) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(top: 6, right: 12),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(widget.category),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        concept,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTeachingStep(LessonContent content) {
    return FrostedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Teaching',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.teaching,
            style: GoogleFonts.inter(
              fontSize: 16,
              height: 1.6,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          TtsControls(text: content.teaching),
        ],
      ),
    );
  }

  Widget _buildDrillStep(LessonContent content) {
    return FrostedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Drill',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.drill.question,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          ...content.drill.options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      _handleDrillAnswer(index == content.drill.answerIndex),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    option,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRewriteStep(LessonContent content) {
    return FrostedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rewrite Challenge',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.rewrite.prompt,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              content.rewrite.input,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _rewriteController,
            maxLines: 3,
            style: const TextStyle(color: Colors.black), // Make user text black
            decoration: InputDecoration(
              hintText: 'Your rewrite...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => _showExample(content.rewrite.example),
            child: const Text('Show Example'),
          ),
        ],
      ),
    );
  }

  Widget _buildReflectionStep(LessonContent content) {
    return FrostedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reflection',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.reflection,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _reflectionController,
            maxLines: 5,
            style: const TextStyle(color: Colors.black), // Make user text black
            decoration: InputDecoration(
              hintText: 'Your thoughts...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(Lesson lesson) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_currentStep > 0)
          ElevatedButton(
            onPressed: _previousStep,
            child: const Text('Previous'),
          )
        else
          const SizedBox(width: 100),
        if (_currentStep <
            5) // Changed from 4 to 5 so reflection step shows Complete Lesson
          ElevatedButton(
            onPressed: _nextStep,
            child: const Text('Next'),
          )
        else
          ElevatedButton(
            onPressed: () => _completeLesson(lesson),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Complete Lesson'),
          ),
      ],
    );
  }

  void _handleDrillAnswer(bool isCorrect) {
    if (isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Correct!'), backgroundColor: Colors.green),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Try again!'), backgroundColor: Colors.orange),
      );
    }
  }

  void _showExample(String example) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Example'),
        content: Text(example),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'charisma':
        return const Color(0xFFE91E63);
      case 'gravity':
        return const Color(0xFF26A69A);
      case 'frame':
        return const Color(0xFF3F51B5);
      case 'scarcity':
        return const Color(0xFFFF9800);
      case 'composed_authority':
        return const Color(0xFF9C27B0);
      case 'hidden_dynamics':
        return const Color(0xFF4CAF50);
      default:
        return Colors.purple;
    }
  }
}
