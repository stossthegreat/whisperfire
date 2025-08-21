import '../models/lesson_models.dart';
import '../models/profile_models.dart';
import '../repos/profile_repo.dart';

class ProgressService {
  final ProfileRepo _repo;
  ProgressService(this._repo);

  int _levelForXp(int xp) => xp>=500?4:xp>=250?3:xp>=100?2:1;

  Future<UserProfile> awardXp(String userId, Lesson lesson) async {
    final p = await _repo.getProfile(userId);
    p.xpTotal += lesson.xp;
    p.ensureCategory(lesson.category);
    final cp = p.categories[lesson.category]!;
    cp.xp += lesson.xp;
    cp.level = _levelForXp(cp.xp);
    p.unlockedLessons.add(lesson.id);
    await _repo.saveProfile(p);
    return p;
  }
} 