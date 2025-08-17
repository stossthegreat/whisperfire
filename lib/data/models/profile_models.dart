import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'profile_models.g.dart';

@JsonSerializable()
class UserProfile extends Equatable {
  @JsonKey(name: 'user_id')
  final String userId;
  final String username;
  @JsonKey(name: 'power_rank')
  final String powerRank;
  final int level;
  final int xp;
  @JsonKey(name: 'next_level_xp')
  final int nextLevelXp;
  @JsonKey(name: 'chosen_mentor')
  final String chosenMentor;
  final List<String> goals;
  final ProfileStats stats;
  final List<String> achievements;
  @JsonKey(name: 'daily_streak')
  final int dailyStreak;
  @JsonKey(name: 'completed_lessons')
  final int completedLessons;
  @JsonKey(name: 'unlocked_worlds')
  final List<String> unlockedWorlds;
  @JsonKey(name: 'saved_tactics')
  final int savedTactics;

  const UserProfile({
    required this.userId,
    required this.username,
    required this.powerRank,
    required this.level,
    required this.xp,
    required this.nextLevelXp,
    required this.chosenMentor,
    required this.goals,
    required this.stats,
    required this.achievements,
    required this.dailyStreak,
    required this.completedLessons,
    required this.unlockedWorlds,
    required this.savedTactics,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @override
  List<Object?> get props => [
    userId,
    username,
    powerRank,
    level,
    xp,
    nextLevelXp,
    chosenMentor,
    goals,
    stats,
    achievements,
    dailyStreak,
    completedLessons,
    unlockedWorlds,
    savedTactics,
  ];
}

@JsonSerializable()
class ProfileStats extends Equatable {
  final int recognition;
  final int resistance;
  final int awareness;
  final int counterplay;
  final int intuition;

  const ProfileStats({
    required this.recognition,
    required this.resistance,
    required this.awareness,
    required this.counterplay,
    required this.intuition,
  });

  factory ProfileStats.fromJson(Map<String, dynamic> json) => _$ProfileStatsFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileStatsToJson(this);

  @override
  List<Object?> get props => [recognition, resistance, awareness, counterplay, intuition];
} 