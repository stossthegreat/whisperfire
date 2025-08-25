import 'lib/content/lessons_catalog.dart';
import 'lib/data/models/lesson_models.dart';
import 'lib/data/repos/lesson_repo.dart';

void main() {
  print('🧪 Testing WhisperFire Lessons System');
  print('=====================================');
  
  // Test 1: Check if lessons catalog loads
  print('\n1. Testing lessons catalog structure...');
  print('Categories: ${lessonsCatalog.keys.toList()}');
  
  // Test 2: Check if we can access a specific lesson
  print('\n2. Testing lesson access...');
  try {
    final lesson = lessonsCatalog['charisma']?[1]?[1];
    if (lesson != null) {
      print('✅ Successfully loaded lesson: ${lesson.title}');
      print('   Category: ${lesson.category}');
      print('   World: ${lesson.world}');
      print('   XP: ${lesson.xp}');
      print('   Hook length: ${lesson.content.hook.length} characters');
      print('   Concepts: ${lesson.content.concept.length}');
    } else {
      print('❌ Failed to load lesson charisma_1_1');
    }
  } catch (e) {
    print('❌ Error loading lesson: $e');
  }
  
  // Test 3: Check lesson repository
  print('\n3. Testing lesson repository...');
  try {
    final repo = LessonRepo();
    final lesson = repo.load('charisma', 1, 1);
    print('✅ Lesson repository working');
  } catch (e) {
    print('❌ Lesson repository error: $e');
  }
  
  // Test 4: Test discoverLessons method
  print('\n4. Testing discoverLessons method...');
  try {
    final repo = LessonRepo();
    final lessons = repo.discoverLessons('charisma', 1);
    print('✅ discoverLessons working: found ${lessons.length} lessons');
    if (lessons.isNotEmpty) {
      print('   First lesson: ${lessons.first.title}');
    }
  } catch (e) {
    print('❌ discoverLessons error: $e');
  }
  
  // Test 5: Count total lessons
  print('\n5. Counting total lessons...');
  int totalLessons = 0;
  for (final category in lessonsCatalog.keys) {
    for (final world in lessonsCatalog[category]!.keys) {
      totalLessons += lessonsCatalog[category]![world]!.length;
    }
  }
  print('Total lessons in catalog: $totalLessons');
  
  print('\n🎉 Lessons system test complete!');
} 