import 'package:flutter/material.dart';
import '../../../data/models/lesson_models.dart';

class HookView extends StatelessWidget {
  final String text;
  final VoidCallback onNext;

  const HookView({
    super.key,
    required this.text,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onNext,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class ConceptView extends StatelessWidget {
  final List<String> points;
  final VoidCallback onNext;

  const ConceptView({
    super.key,
    required this.points,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Concepts',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: points.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}.',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          points[index],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: onNext,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class DrillView extends StatelessWidget {
  final Drill drill;
  final void Function(int selectedIdx) onAnswered;

  const DrillView({
    super.key,
    required this.drill,
    required this.onAnswered,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Drill',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            drill.question,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Column(
              children: drill.options.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => onAnswered(index),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        option,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class RewriteView extends StatefulWidget {
  final RewriteTask task;
  final void Function(String) onSubmit;

  const RewriteView({
    super.key,
    required this.task,
    required this.onSubmit,
  });

  @override
  State<RewriteView> createState() => _RewriteViewState();
}

class _RewriteViewState extends State<RewriteView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rewrite Challenge',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            widget.task.prompt,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Original: "${widget.task.input}"',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Example: "${widget.task.example}"',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                hintText: 'Write your rewrite here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => widget.onSubmit(_controller.text),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class SimulationView extends StatefulWidget {
  final LessonSimulation simulation;
  final void Function(bool success) onResult;

  const SimulationView({
    super.key,
    required this.simulation,
    required this.onResult,
  });

  @override
  State<SimulationView> createState() => _SimulationViewState();
}

class _SimulationViewState extends State<SimulationView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Simulation',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            widget.simulation.setup,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                hintText: 'Type your response...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final response = _controller.text;
              final success = _evaluateResponse(response);
              widget.onResult(success);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  bool _evaluateResponse(String response) {
    // MVP scoring: success if reply is short, contains intrigue words, and excludes over-explaining words
    if (response.length >= 140) return false;

    final intrigueWords = ['maybe', 'later', 'curious', 'earn', 'depends'];
    final overExplainingWords = ['because', 'let me explain'];

    final hasIntrigue =
        intrigueWords.any((word) => response.toLowerCase().contains(word));
    final hasOverExplaining = overExplainingWords
        .any((word) => response.toLowerCase().contains(word));

    return hasIntrigue && !hasOverExplaining;
  }
}

class ReflectionView extends StatelessWidget {
  final String prompt;
  final Future<void> Function() onDone;

  const ReflectionView({
    super.key,
    required this.prompt,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reflection',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            prompt,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          const Expanded(
            child: Center(
              child: Text(
                'Take a moment to reflect on this lesson...',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await onDone();
            },
            child: const Text('Complete Reflection'),
          ),
        ],
      ),
    );
  }
}

class CompleteView extends StatelessWidget {
  final int xp;
  final VoidCallback onExitOrNext;

  const CompleteView({
    super.key,
    required this.xp,
    required this.onExitOrNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(height: 24),
          Text(
            'Lesson Complete!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            '+$xp XP',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onExitOrNext,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
