import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_models.dart';

class ProfileRepo {
  static const _key = 'user_profile_v1';

  Future<UserProfile> getProfile(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return UserProfile(id: userId);
    final m = json.decode(raw) as Map<String, dynamic>;
    return UserProfile.fromJson(m);
  }

  Future<void> saveProfile(UserProfile p) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, json.encode(p.toJson()));
  }
}
