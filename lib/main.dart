import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'data/services/cache_service.dart';
import 'core/taxonomy/tag_migration.dart';
import 'core/streak/streak_service.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // Run tag migration to update old category names to new IDs
  await migrateTagNamesToIds();

  // Initialize streak service
  await StreakService.init();

  // Initialize cache service
  await CacheService.init();

  runApp(
    const ProviderScope(
      child: WhisperfireApp(),
    ),
  );
}
