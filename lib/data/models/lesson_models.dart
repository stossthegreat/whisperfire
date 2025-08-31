class Lesson {
  final String id, title, category;
  final int world, lesson, xp;
  final LessonContent content;
  final List<String> prerequisites;

  const Lesson({
    required this.id,
    required this.title,
    required this.category,
    required this.world,
    required this.lesson,
    required this.xp,
    required this.content,
    this.prerequisites = const [],
  });
}

class LessonContent {
  final String hook, reflection, teaching;
  final List<String> concept;
  final Drill drill;
  final RewriteTask rewrite;

  const LessonContent({
    required this.hook,
    required this.concept,
    required this.teaching,
    required this.drill,
    required this.rewrite,
    required this.reflection,
  });
}

class Drill {
  final String question;
  final List<String> options; // length 2
  final int answerIndex; // 0 or 1

  const Drill(
      {required this.question,
      required this.options,
      required this.answerIndex});
}

class RewriteTask {
  final String prompt, input, example;

  const RewriteTask(
      {required this.prompt, required this.input, required this.example});
}

class LessonSimulation {
  final String setup, failText, successText;
  final List<String> successHints; // 3 hints

  const LessonSimulation({
    required this.setup,
    required this.successHints,
    required this.failText,
    required this.successText,
  });
}
