import 'lib/content/lessons_catalog.dart';

void main() {
  print('🧪 Testing Lesson Loading');
  print('=========================');
  
  // Test 1: Check if we can access the catalog
  print('\n1. Checking catalog access...');
  print('Categories: ${lessonsCatalog.keys.toList()}');
  
  // Test 2: Check charisma category
  print('\n2. Checking charisma category...');
  final charismaWorlds = lessonsCatalog['charisma'];
  if (charismaWorlds != null) {
    print('✅ Charisma category found');
    print('Worlds: ${charismaWorlds.keys.toList()}');
    
    // Test 3: Check world 1
    print('\n3. Checking world 1...');
    final world1 = charismaWorlds[1];
    if (world1 != null) {
      print('✅ World 1 found');
      print('Lessons: ${world1.keys.toList()}');
      print('Lesson count: ${world1.length}');
      
      // Test 4: Check lesson 1
      print('\n4. Checking lesson 1...');
      final lesson1 = world1[1];
      if (lesson1 != null) {
        print('✅ Lesson 1 found!');
        print('Title: ${lesson1.title}');
        print('XP: ${lesson1.xp}');
        print('Hook length: ${lesson1.content.hook.length}');
      } else {
        print('❌ Lesson 1 not found');
      }
    } else {
      print('❌ World 1 not found');
    }
  } else {
    print('❌ Charisma category not found');
  }
  
  print('\n🎉 Test complete!');
} 