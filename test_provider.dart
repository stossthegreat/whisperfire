import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'lib/data/repos/lesson_repo.dart';
import 'lib/data/models/lesson_models.dart';

void main() {
  print('🧪 Testing Provider System');
  print('==========================');
  
  // Test 1: Check if LessonRepo works directly
  print('\n1. Testing LessonRepo directly...');
  try {
    final repo = LessonRepo();
    final lessons = repo.discoverLessons('seduction', 1);
    print('✅ LessonRepo.discoverLessons returned: $lessons');
  } catch (e) {
    print('❌ LessonRepo error: $e');
  }
  
  // Test 2: Check if we can create a simple provider
  print('\n2. Testing simple provider...');
  try {
    final provider = Provider<LessonRepo>((ref) => LessonRepo());
    print('✅ Provider created successfully');
  } catch (e) {
    print('❌ Provider creation error: $e');
  }
  
  print('\n🎉 Provider test complete!');
} 