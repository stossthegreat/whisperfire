import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'repos/lesson_repo.dart';
import 'repos/profile_repo.dart';
import 'services/progress_service.dart';
import 'models/lesson_models.dart';
import 'models/profile_models.dart';

final lessonRepoProvider = Provider((_) => LessonRepo());
final profileRepoProvider = Provider((_) => ProfileRepo());
final progressServiceProvider =
    Provider((ref) => ProgressService(ref.read(profileRepoProvider)));
final currentUserIdProvider = StateProvider<String>((_) => 'user_001');

// Profile provider
final userProfileProvider = FutureProvider<UserProfile>((ref) async {
  final repo = ref.read(profileRepoProvider);
  final userId = ref.read(currentUserIdProvider);
  return repo.getProfile(userId);
});

// World lessons provider - fixed to prevent infinite loops
final worldLessonsProvider =
    FutureProvider.family<List<Lesson>, (String, int)>((ref, params) async {
  final (category, world) = params;
  final repo = ref.read(lessonRepoProvider);
  return repo.discoverLessons(category, world);
});

// Lesson loading provider
final lessonProvider =
    FutureProvider.family<Lesson?, Map<String, dynamic>>((ref, params) async {
  final lessonRepo = ref.read(lessonRepoProvider);
  try {
    final category = params['category'] as String;
    final world = params['world'] as int;
    final lesson = params['lesson'] as int;
    return await lessonRepo.load(category, world, lesson);
  } catch (e) {
    return null;
  }
});

// Lesson count provider
final lessonCountProvider =
    FutureProvider.family<int, Map<String, dynamic>>((ref, params) async {
  final category = params['category'] as String;
  final world = params['world'] as int;
  final lessonRepo = ref.read(lessonRepoProvider);
  try {
    final lessons = await lessonRepo.discoverLessons(category, world);
    return lessons.length;
  } catch (e) {
    return 0;
  }
});
