import 'package:whisperfire/content/lessons_catalog.dart';
import '../models/lesson_models.dart';

class LessonRepo {
  Future<Lesson> load(String category, int world, int lesson) async {
    final w = lessonsCatalog[category];
    if (w == null) throw 'Unknown category: $category';
    final m = w[world];
    if (m == null) throw 'Unknown world: $world';
    final l = m[lesson];
    if (l == null)
      throw 'Lesson not found: $category/world$world/lesson$lesson';
    return l;
  }

  Future<List<Lesson>> discoverLessons(String category, int world) {
    final worldMap = lessonsCatalog[category];
    if (worldMap == null) return Future.value([]);

    final lessonMap = worldMap[world];
    if (lessonMap == null) return Future.value([]);

    final lessons = lessonMap.values.toList();
    if (lessons.isNotEmpty) {
      lessons.sort((a, b) => a.lesson.compareTo(b.lesson));
    }

    return Future.value(lessons);
  }

  Future<Map<int, List<Lesson>>> discoverWorlds(String category) async {
    final c = lessonsCatalog[category] ?? const {};
    return {
      for (final w in [1, 2, 3, 4])
        w: (c[w]?.values.toList()
              ?..sort((a, b) => a.lesson.compareTo(b.lesson))) ??
            <Lesson>[],
    };
  }
}
