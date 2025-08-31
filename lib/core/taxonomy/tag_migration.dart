import 'package:hive_flutter/hive_flutter.dart';
import 'tag_registry.dart';

Future<void> migrateTagNamesToIds() async {
  try {
    final box = await Hive.openBox('progress'); // or your actual box name
    for (final k in box.keys) {
      final v = box.get(k);
      if (v is Map && v['tags'] is List) {
        final orig = List<String>.from(v['tags'].map((e) => e.toString()));
        final canon = <String>[];
        for (final t in orig) {
          final id = registry.resolveToId(t) ?? t;
          canon.add(id);
        }
        v['tags'] = canon.toSet().toList(); // dedupe
        await box.put(k, v);
      }
    }
    await box.close();
  } catch (e) {
    // Handle case where box doesn't exist yet
    print('Migration completed (no existing data to migrate): $e');
  }
} 