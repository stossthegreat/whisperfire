import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_models.dart';
import '../services/gating_service.dart';

class ProfileRepo {
  static const _key = 'user_profile_v1';

  Future<UserProfile> getProfile(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) {
      final p = UserProfile(id: userId);
      if (p.unlockedCategories.isEmpty) {
        p.unlockedCategories = GatingService.defaultUnlockedCategories();
      }
      return p;
    }
    final m = json.decode(raw) as Map<String, dynamic>;
    final p = UserProfile.fromJson(m);
    if (p.unlockedCategories.isEmpty) {
      p.unlockedCategories = GatingService.defaultUnlockedCategories();
    }
    return p;
  }

  Future<void> saveProfile(UserProfile p) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(p.toJson()));
  }
}
