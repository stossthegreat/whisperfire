class CategoryProgress {
  int xp;
  int level;

  CategoryProgress({this.xp = 0, this.level = 1});

  factory CategoryProgress.fromJson(Map<String, dynamic> json) {
    return CategoryProgress(
      xp: json['xp'] as int? ?? 0,
      level: json['level'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'xp': xp,
      'level': level,
    };
  }
}

class UserProfile {
  String id;
  int xpTotal;
  Map<String, CategoryProgress> categories;
  Set<String> unlockedLessons;
  bool hasSeenOnboarding;
  Set<String> unlockedCategories;

  UserProfile({
    required this.id,
    this.xpTotal = 0,
    Map<String, CategoryProgress>? categories,
    Set<String>? unlockedLessons,
    this.hasSeenOnboarding = false,
    Set<String>? unlockedCategories,
  })  : categories = categories ?? {},
        unlockedLessons = unlockedLessons ?? {},
        unlockedCategories = unlockedCategories ?? {};

  void ensureCategory(String key) {
    categories.putIfAbsent(key, () => CategoryProgress());
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    final categoriesMap = <String, CategoryProgress>{};
    if (json['categories'] != null) {
      final categoriesJson = json['categories'] as Map<String, dynamic>;
      categoriesJson.forEach((key, value) {
        categoriesMap[key] =
            CategoryProgress.fromJson(value as Map<String, dynamic>);
      });
    }

    final unlockedLessonsSet = <String>{};
    if (json['unlockedLessons'] != null) {
      final unlockedList = json['unlockedLessons'] as List<dynamic>;
      unlockedLessonsSet.addAll(unlockedList.cast<String>());
    }

    final unlockedCategoriesSet = <String>{};
    if (json['unlockedCategories'] != null) {
      final unlockedCatList = json['unlockedCategories'] as List<dynamic>;
      unlockedCategoriesSet.addAll(unlockedCatList.cast<String>());
    }

    return UserProfile(
      id: json['id'] as String,
      xpTotal: json['xpTotal'] as int? ?? 0,
      categories: categoriesMap,
      unlockedLessons: unlockedLessonsSet,
      hasSeenOnboarding: json['hasSeenOnboarding'] as bool? ?? false,
      unlockedCategories: unlockedCategoriesSet,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'xpTotal': xpTotal,
      'categories': categories.map((key, value) => MapEntry(key, value.toJson())),
      'unlockedLessons': unlockedLessons.toList(),
      'hasSeenOnboarding': hasSeenOnboarding,
      'unlockedCategories': unlockedCategories.toList(),
    };
  }
}
