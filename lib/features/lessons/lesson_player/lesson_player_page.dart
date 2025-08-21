import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:confetti/confetti.dart';
import '../../../data/providers.dart';
import '../../../data/models/lesson_models.dart';
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
  
  @override
  void initState() {
    super.initState();
    _lessonFuture = ref.read(lessonRepoProvider).load(
      widget.category, 
      widget.world, 
      widget.lesson
    );
    _confettiController = ConfettiController(duration: const Duration(milliseconds: 1200));
    _pageController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _cardController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cardController.forward();
    });
  }
  
  @override
  void dispose() {
    _confettiController.dispose();
    _pageController.dispose();
    _cardController.dispose();
    super.dispose();
  }
  
  void _nextStep() {
    if (_currentStep < 4) {
      setState(() {
        _currentStep++;
      });
      _pageController.forward(from: 0);
    }
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
    _confettiController.play();
    
    // Award XP
    final userId = ref.read(currentUserIdProvider);
    await ref.read(progressServiceProvider).awardXp(userId, lesson);
    
    // Show completion dialog
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _buildCompletionDialog(lesson),
      );
    }
  }
  
  Widget _buildCompletionDialog(Lesson lesson) {
    return AlertDialog(
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Back to Worlds'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            // TODO: Navigate to next lesson
          },
          child: const Text('Next Lesson'),
        ),
      ],
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
                    _getCategoryColor(lesson.category).withValues(alpha: 0.8),
                    _getCategoryColor(lesson.category).withValues(alpha: 0.6),
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
    final steps = ['Hook', 'Concept', 'Drill', 'Rewrite', 'Reflection'];
    
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
                color: isActive ? _getCategoryColor(widget.category) : Colors.grey,
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
        return _buildDrillStep(lesson.content);
      case 3:
        return _buildRewriteStep(lesson.content);
      case 4:
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
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.hook,
            style: GoogleFonts.inter(fontSize: 16, height: 1.6),
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
                    style: GoogleFonts.inter(fontSize: 16, height: 1.5),
                  ),
                ),
              ],
            ),
          )),
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
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.drill.question,
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
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
                  onPressed: () => _handleDrillAnswer(index == content.drill.answerIndex),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    option,
                    style: GoogleFonts.inter(fontSize: 16),
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
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.rewrite.prompt,
            style: GoogleFonts.inter(fontSize: 16),
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
              style: GoogleFonts.inter(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            maxLines: 3,
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
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content.reflection,
            style: GoogleFonts.inter(fontSize: 16),
          ),
          const SizedBox(height: 24),
          TextField(
            maxLines: 5,
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
        
        if (_currentStep < 5)
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
        const SnackBar(content: Text('Correct!'), backgroundColor: Colors.green),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Try again!'), backgroundColor: Colors.orange),
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
      case 'seduction': return const Color(0xFFE91E63);
      case 'gravity': return const Color(0xFF26A69A);
      case 'frame': return const Color(0xFF3F51B5);
      case 'scarcity': return const Color(0xFFFF9800);
      case 'psychwar': return const Color(0xFF9C27B0);
      case 'deception': return const Color(0xFF4CAF50);
      default: return Colors.purple;
    }
  }
} 