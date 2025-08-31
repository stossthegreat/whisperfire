import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'settings_models.g.dart';

@JsonSerializable()
class AppSettings extends Equatable {
  @JsonKey(name: 'default_tone')
  final String
      defaultTone; // "brutal|soft|clinical" maps to "savage|soft|clinical"
  @JsonKey(name: 'default_analyze_mode')
  final String defaultAnalyzeMode; // "scan|pattern"
  final bool streaming;
  @JsonKey(name: 'save_history')
  final bool saveHistory;
  @JsonKey(name: 'ocr_lang')
  final String ocrLang; // "eng"
  @JsonKey(name: 'safe_mode')
  final bool safeMode;

  const AppSettings({
    required this.defaultTone,
    required this.defaultAnalyzeMode,
    required this.streaming,
    required this.saveHistory,
    required this.ocrLang,
    required this.safeMode,
  });

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);

  // Default settings
  factory AppSettings.defaults() => const AppSettings(
        defaultTone: 'brutal', // Maps to 'savage'
        defaultAnalyzeMode: 'scan',
        streaming: true,
        saveHistory: true,
        ocrLang: 'eng',
        safeMode: false,
      );

  AppSettings copyWith({
    String? defaultTone,
    String? defaultAnalyzeMode,
    bool? streaming,
    bool? saveHistory,
    String? ocrLang,
    bool? safeMode,
  }) {
    return AppSettings(
      defaultTone: defaultTone ?? this.defaultTone,
      defaultAnalyzeMode: defaultAnalyzeMode ?? this.defaultAnalyzeMode,
      streaming: streaming ?? this.streaming,
      saveHistory: saveHistory ?? this.saveHistory,
      ocrLang: ocrLang ?? this.ocrLang,
      safeMode: safeMode ?? this.safeMode,
    );
  }

  @override
  List<Object?> get props => [
        defaultTone,
        defaultAnalyzeMode,
        streaming,
        saveHistory,
        ocrLang,
        safeMode
      ];
}
