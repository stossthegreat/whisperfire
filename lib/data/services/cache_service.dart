import 'package:hive_flutter/hive_flutter.dart';
import '../models/settings_models.dart';
import '../models/profile_models.dart';

class CacheService {
  static const String settingsBoxName = 'settings';
  static const String profileBoxName = 'profile';
  static const String historyBoxName = 'history';

  static late Box<Map> _settingsBox;
  static late Box<Map> _profileBox;
  static late Box<Map> _historyBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox<Map>(settingsBoxName);
    _profileBox = await Hive.openBox<Map>(profileBoxName);
    _historyBox = await Hive.openBox<Map>(historyBoxName);
  }

  // Settings methods
  static Future<void> saveSettings(AppSettings settings) async {
    await _settingsBox.put('current', settings.toJson());
  }

  static AppSettings getSettings() {
    final settingsMap = _settingsBox.get('current');
    if (settingsMap == null) {
      return AppSettings.defaults();
    }
    try {
      return AppSettings.fromJson(Map<String, dynamic>.from(settingsMap));
    } catch (e) {
      // Return defaults if corrupted
      return AppSettings.defaults();
    }
  }

  // Profile methods
  static Future<void> saveProfile(UserProfile profile) async {
    await _profileBox.put('current', profile.toJson());
  }

  static UserProfile? getProfile() {
    final profileMap = _profileBox.get('current');
    if (profileMap == null) return null;
    try {
      return UserProfile.fromJson(Map<String, dynamic>.from(profileMap));
    } catch (e) {
      return null;
    }
  }

  // History methods (for analyze/mentor sessions)
  static Future<void> saveAnalysisHistory(
      String sessionId, Map<String, dynamic> data) async {
    final settings = getSettings();
    if (!settings.saveHistory) return;

    await _historyBox.put('analysis_$sessionId', {
      'timestamp': DateTime.now().toIso8601String(),
      'type': 'analysis',
      'data': data,
    });
  }

  static Future<void> saveMentorHistory(
      String sessionId, Map<String, dynamic> data) async {
    final settings = getSettings();
    if (!settings.saveHistory) return;

    await _historyBox.put('mentor_$sessionId', {
      'timestamp': DateTime.now().toIso8601String(),
      'type': 'mentor',
      'data': data,
    });
  }

  static List<Map<String, dynamic>> getRecentHistory({int limit = 10}) {
    final allHistory = _historyBox.values
        .map((item) => Map<String, dynamic>.from(item))
        .toList();

    // Sort by timestamp descending
    allHistory.sort((a, b) {
      final aTime = DateTime.tryParse(a['timestamp'] ?? '') ?? DateTime(1970);
      final bTime = DateTime.tryParse(b['timestamp'] ?? '') ?? DateTime(1970);
      return bTime.compareTo(aTime);
    });

    return allHistory.take(limit).toList();
  }

  static Future<void> clearHistory() async {
    await _historyBox.clear();
  }

  static Future<void> clearAll() async {
    await _settingsBox.clear();
    await _profileBox.clear();
    await _historyBox.clear();
  }

  static void dispose() {
    _settingsBox.close();
    _profileBox.close();
    _historyBox.close();
  }
}
