import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
	static const String _key = 'onboarding_complete_v1';
	static bool _completed = false;
	static bool _initialized = false;

	static bool get isCompleted => _completed;

	static Future<void> init() async {
		if (_initialized) return;
		final prefs = await SharedPreferences.getInstance();
		_completed = prefs.getBool(_key) ?? false;
		_initialized = true;
	}

	static Future<void> complete() async {
		final prefs = await SharedPreferences.getInstance();
		await prefs.setBool(_key, true);
		_completed = true;
	}

	static Future<void> reset() async {
		final prefs = await SharedPreferences.getInstance();
		await prefs.remove(_key);
		_completed = false;
	}
} 