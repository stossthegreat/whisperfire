// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      userId: json['user_id'] as String,
      username: json['username'] as String,
      powerRank: json['power_rank'] as String,
      level: (json['level'] as num).toInt(),
      xp: (json['xp'] as num).toInt(),
      nextLevelXp: (json['next_level_xp'] as num).toInt(),
      chosenMentor: json['chosen_mentor'] as String,
      goals: (json['goals'] as List<dynamic>).map((e) => e as String).toList(),
      stats: ProfileStats.fromJson(json['stats'] as Map<String, dynamic>),
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      dailyStreak: (json['daily_streak'] as num).toInt(),
      completedLessons: (json['completed_lessons'] as num).toInt(),
      unlockedWorlds: (json['unlocked_worlds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      savedTactics: (json['saved_tactics'] as num).toInt(),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'power_rank': instance.powerRank,
      'level': instance.level,
      'xp': instance.xp,
      'next_level_xp': instance.nextLevelXp,
      'chosen_mentor': instance.chosenMentor,
      'goals': instance.goals,
      'stats': instance.stats,
      'achievements': instance.achievements,
      'daily_streak': instance.dailyStreak,
      'completed_lessons': instance.completedLessons,
      'unlocked_worlds': instance.unlockedWorlds,
      'saved_tactics': instance.savedTactics,
    };

ProfileStats _$ProfileStatsFromJson(Map<String, dynamic> json) => ProfileStats(
      recognition: (json['recognition'] as num).toInt(),
      resistance: (json['resistance'] as num).toInt(),
      awareness: (json['awareness'] as num).toInt(),
      counterplay: (json['counterplay'] as num).toInt(),
      intuition: (json['intuition'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileStatsToJson(ProfileStats instance) =>
    <String, dynamic>{
      'recognition': instance.recognition,
      'resistance': instance.resistance,
      'awareness': instance.awareness,
      'counterplay': instance.counterplay,
      'intuition': instance.intuition,
    };
