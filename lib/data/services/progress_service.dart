import '../models/lesson_models.dart';
import '../models/profile_models.dart';
import '../repos/profile_repo.dart';
import 'package:flutter/foundation.dart';
import 'gating_service.dart';

class ProgressService {
  final ProfileRepo _repo;
  ProgressService(this._repo);

  int _levelForXp(int xp) => xp >= 500
      ? 4
      : xp >= 250
          ? 3
          : xp >= 100
              ? 2
              : 1;

  Future<UserProfile> awardXp(String userId, Lesson lesson) async {
    final p = await _repo.getProfile(userId);

    // Check if lesson has already been completed to prevent duplicate XP
    if (p.unlockedLessons.contains(lesson.id)) {
      if (kDebugMode) {
        // Lesson already completed. Skipping XP award.
      }
      return p;
    }

    // Award XP for first-time completion
    if (kDebugMode) {
      // Awarding XP for lesson
    }

    p.xpTotal += lesson.xp;
    p.ensureCategory(lesson.category);
    final cp = p.categories[lesson.category]!;
    cp.xp += lesson.xp;
    cp.level = _levelForXp(cp.xp);
    p.unlockedLessons.add(lesson.id);

    // If category now completed, unlock next category
    if (GatingService.isCategoryCompleted(p, lesson.category)) {
      final nextCat = GatingService.nextCategoryToUnlock(lesson.category);
      if (nextCat != null) {
        p.unlockedCategories.add(nextCat);
      }
    }

    await _repo.saveProfile(p);
    return p;
  }
}
