import 'package:hive_flutter/hive_flutter.dart';

class StreakData {
  final int currentStreak;
  final int longestStreak;
  final DateTime lastCompletionDate;
  final int streakFreezesUsed;
  final DateTime? lastFreezeDate;

  const StreakData({
    required this.currentStreak,
    required this.longestStreak,
    required this.lastCompletionDate,
    this.streakFreezesUsed = 0,
    this.lastFreezeDate,
  });

  StreakData copyWith({
    int? currentStreak,
    int? longestStreak,
    DateTime? lastCompletionDate,
    int? streakFreezesUsed,
    DateTime? lastFreezeDate,
  }) {
    return StreakData(
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastCompletionDate: lastCompletionDate ?? this.lastCompletionDate,
      streakFreezesUsed: streakFreezesUsed ?? this.streakFreezesUsed,
      lastFreezeDate: lastFreezeDate ?? this.lastFreezeDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastCompletionDate': lastCompletionDate.millisecondsSinceEpoch,
      'streakFreezesUsed': streakFreezesUsed,
      'lastFreezeDate': lastFreezeDate?.millisecondsSinceEpoch,
    };
  }

  factory StreakData.fromJson(Map<String, dynamic> json) {
    return StreakData(
      currentStreak: json['currentStreak'] ?? 0,
      longestStreak: json['longestStreak'] ?? 0,
      lastCompletionDate: DateTime.fromMillisecondsSinceEpoch(json['lastCompletionDate'] ?? DateTime.now().millisecondsSinceEpoch),
      streakFreezesUsed: json['streakFreezesUsed'] ?? 0,
      lastFreezeDate: json['lastFreezeDate'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(json['lastFreezeDate'])
          : null,
    );
  }
}

class StreakService {
  static const String _streakBoxName = 'streak_data';
  static const String _streakKey = 'current_streak';

  static Future<void> init() async {
    await Hive.openBox(_streakBoxName);
  }

  static Future<StreakData> getStreakData() async {
    final box = Hive.box(_streakBoxName);
    final data = box.get(_streakKey);
    
    if (data != null) {
      return StreakData.fromJson(Map<String, dynamic>.from(data));
    }
    
    // Return default streak data
    return StreakData(
      currentStreak: 0,
      longestStreak: 0,
      lastCompletionDate: DateTime.now(),
    );
  }

  static Future<void> saveStreakData(StreakData streakData) async {
    final box = Hive.box(_streakBoxName);
    await box.put(_streakKey, streakData.toJson());
  }

  static Future<void> completeLesson() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final streakData = await getStreakData();
    
    // Check if we already completed today
    final lastCompletion = DateTime(
      streakData.lastCompletionDate.year,
      streakData.lastCompletionDate.month,
      streakData.lastCompletionDate.day,
    );
    
    if (lastCompletion.isAtSameMomentAs(today)) {
      return; // Already completed today
    }

    // Calculate new streak
    int newStreak = 1; // At least 1 for today
    
    final yesterday = today.subtract(const Duration(days: 1));
    
    if (lastCompletion.isAtSameMomentAs(yesterday)) {
      // Consecutive day
      newStreak = streakData.currentStreak + 1;
    } else if (lastCompletion.isAtSameMomentAs(today.subtract(const Duration(days: 2)))) {
      // Check if we can use a streak freeze
      if (streakData.streakFreezesUsed < 2 && 
          (streakData.lastFreezeDate == null || 
           streakData.lastFreezeDate!.isBefore(today.subtract(const Duration(days: 7))))) {
        // Use streak freeze
        newStreak = streakData.currentStreak + 1;
        final updatedData = streakData.copyWith(
          currentStreak: newStreak,
          longestStreak: newStreak > streakData.longestStreak ? newStreak : streakData.longestStreak,
          lastCompletionDate: now,
          streakFreezesUsed: streakData.streakFreezesUsed + 1,
          lastFreezeDate: now,
        );
        await saveStreakData(updatedData);
        return;
      }
    }
    // Otherwise, streak breaks

    final updatedData = streakData.copyWith(
      currentStreak: newStreak,
      longestStreak: newStreak > streakData.longestStreak ? newStreak : streakData.longestStreak,
      lastCompletionDate: now,
    );
    
    await saveStreakData(updatedData);
  }

  static double getStreakMultiplier(int streak) {
    if (streak >= 7) return 3.0;
    if (streak >= 4) return 2.0;
    if (streak >= 2) return 1.5;
    return 1.0;
  }

  static String getStreakMessage(int streak) {
    if (streak == 0) return "Start your learning journey!";
    if (streak == 1) return "Great start! Keep it up!";
    if (streak < 7) return "Amazing! $streak day streak!";
    if (streak < 30) return "Incredible! $streak day streak!";
    if (streak < 100) return "Legendary! $streak day streak!";
    return "Unstoppable! $streak day streak!";
  }
} 