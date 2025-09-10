import '../../content/lessons_catalog.dart';
import '../models/lesson_models.dart';
import '../models/profile_models.dart';

class GatingService {
  // Configure how many categories are initially available
  static const int initialUnlockedCategoryCount = 1; // change to 2 if needed

  static List<String> get orderedCategories => List<String>.from(kCategories);

  static bool isCategoryUnlocked(UserProfile profile, String category) {
    return profile.unlockedCategories.contains(category);
  }

  static bool isCategoryCompleted(UserProfile profile, String category) {
    final cat = lessonsCatalog[category];
    if (cat == null || cat.isEmpty) return false;
    for (final entry in cat.entries) {
      final lessonsInWorld = entry.value.values;
      for (final lesson in lessonsInWorld) {
        if (!profile.unlockedLessons.contains(lesson.id)) {
          return false;
        }
      }
    }
    return true;
  }

  // A world is considered unlocked if it contains the next lesson to play OR any completed lesson
  static bool isWorldUnlocked(UserProfile profile, String category, int world) {
    if (!isCategoryUnlocked(profile, category)) return false;
    final next = findNextLessonInCategory(profile, category);
    if (next != null && next.world == world) return true;

    final cat = lessonsCatalog[category];
    final worldLessons = cat?[world];
    if (worldLessons == null) return false;
    return worldLessons.values.any((l) => profile.unlockedLessons.contains(l.id));
  }

  static Lesson? findNextLessonInCategory(UserProfile profile, String category) {
    if (!isCategoryUnlocked(profile, category)) return null;
    final cat = lessonsCatalog[category];
    if (cat == null) return null;
    final sortedWorlds = cat.keys.toList()..sort();
    for (final w in sortedWorlds) {
      final lessons = cat[w]!
          .values
          .toList()
          ..sort((a, b) => a.lesson.compareTo(b.lesson));
      for (final l in lessons) {
        if (!profile.unlockedLessons.contains(l.id)) return l;
      }
    }
    return null; // category finished
  }

  static bool isLessonUnlocked(UserProfile profile, Lesson lesson) {
    // Only the next uncompleted lesson is playable
    final next = findNextLessonInCategory(profile, lesson.category);
    return next != null && next.id == lesson.id;
  }

  static String? nextCategoryToUnlock(String justCompletedCategory) {
    final idx = orderedCategories.indexOf(justCompletedCategory);
    if (idx == -1) return null;
    if (idx + 1 < orderedCategories.length) {
      return orderedCategories[idx + 1];
    }
    return null;
  }

  static Set<String> defaultUnlockedCategories() {
    return orderedCategories
        .take(initialUnlockedCategoryCount)
        .toSet();
  }
} 