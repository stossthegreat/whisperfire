import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'whisperfire_models.g.dart';

// ============================
// UNIFIED WHISPERFIRE SCHEMA
// ============================

@JsonSerializable()
class WhisperfireResponse extends Equatable {
  final WhisperfireContext context;
  final String headline;

  @JsonKey(name: 'core_take')
  final String coreTake;

  final WhisperfireTactic tactic;
  final String motives;
  final String targeting;

  @JsonKey(name: 'power_play')
  final String powerPlay;

  final List<String> receipts;

  @JsonKey(name: 'next_moves')
  final String nextMoves;

  @JsonKey(name: 'suggested_reply')
  final WhisperfireSuggestedReply suggestedReply;

  final WhisperfireSafety safety;
  final WhisperfireMetrics metrics;

  final WhisperfirePattern? pattern;
  final WhisperfireAmbiguity? ambiguity;

  // Optional enrichers for Pattern mode
  @JsonKey(name: 'hidden_agenda')
  final String? hiddenAgenda;

  final List<WhisperfireArchetype>? archetypes;

  @JsonKey(name: 'trigger_pattern_map')
  final String? triggerPatternMap;

  final List<String>? contradictions;
  final List<String>? weapons;
  final List<WhisperfireForecast>? forecast;

  @JsonKey(name: 'counter_intervention')
  final String? counterIntervention;

  @JsonKey(name: 'long_game')
  final String? longGame;

  const WhisperfireResponse({
    required this.context,
    required this.headline,
    required this.coreTake,
    required this.tactic,
    required this.motives,
    required this.targeting,
    required this.powerPlay,
    required this.receipts,
    required this.nextMoves,
    required this.suggestedReply,
    required this.safety,
    required this.metrics,
    this.pattern,
    this.ambiguity,
    this.hiddenAgenda,
    this.archetypes,
    this.triggerPatternMap,
    this.contradictions,
    this.weapons,
    this.forecast,
    this.counterIntervention,
    this.longGame,
  });

  factory WhisperfireResponse.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireResponseToJson(this);

  @override
  List<Object?> get props => [
        context,
        headline,
        coreTake,
        tactic,
        motives,
        targeting,
        powerPlay,
        receipts,
        nextMoves,
        suggestedReply,
        safety,
        metrics,
        pattern,
        ambiguity,
        hiddenAgenda,
        archetypes,
        triggerPatternMap,
        contradictions,
        weapons,
        forecast,
        counterIntervention,
        longGame,
      ];
}

@JsonSerializable()
class WhisperfireContext extends Equatable {
  final String relationship;
  final String tone;

  @JsonKey(name: 'content_type')
  final String contentType;

  @JsonKey(name: 'subject_name')
  final String? subjectName;

  final String tab;

  const WhisperfireContext({
    required this.relationship,
    required this.tone,
    required this.contentType,
    this.subjectName,
    required this.tab,
  });

  factory WhisperfireContext.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireContextFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireContextToJson(this);

  @override
  List<Object?> get props =>
      [relationship, tone, contentType, subjectName, tab];
}

@JsonSerializable()
class WhisperfireTactic extends Equatable {
  final String label; // e.g., "Gaslighting"
  final int confidence; // 0-100

  const WhisperfireTactic({
    required this.label,
    required this.confidence,
  });

  factory WhisperfireTactic.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireTacticFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireTacticToJson(this);

  @override
  List<Object?> get props => [label, confidence];
}

@JsonSerializable()
class WhisperfireSuggestedReply extends Equatable {
  final String style; // "clipped|one_liner|reverse_uno|monologue"
  final String text;

  const WhisperfireSuggestedReply({
    required this.style,
    required this.text,
  });

  factory WhisperfireSuggestedReply.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireSuggestedReplyFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireSuggestedReplyToJson(this);

  @override
  List<Object?> get props => [style, text];
}

@JsonSerializable()
class WhisperfireSafety extends Equatable {
  @JsonKey(name: 'risk_level')
  final String riskLevel; // "LOW|MODERATE|HIGH|CRITICAL"
  final String notes;

  const WhisperfireSafety({
    required this.riskLevel,
    required this.notes,
  });

  factory WhisperfireSafety.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireSafetyFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireSafetyToJson(this);

  @override
  List<Object?> get props => [riskLevel, notes];
}

@JsonSerializable()
class WhisperfireMetrics extends Equatable {
  @JsonKey(name: 'red_flag')
  final int redFlag; // 0-100

  final int certainty; // 0-100

  @JsonKey(name: 'viral_potential')
  final int viralPotential; // 0-100

  const WhisperfireMetrics({
    required this.redFlag,
    required this.certainty,
    required this.viralPotential,
  });

  factory WhisperfireMetrics.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireMetricsToJson(this);

  @override
  List<Object?> get props => [redFlag, certainty, viralPotential];
}

@JsonSerializable()
class WhisperfirePattern extends Equatable {
  final String? cycle;
  final String? prognosis;

  const WhisperfirePattern({
    this.cycle,
    this.prognosis,
  });

  factory WhisperfirePattern.fromJson(Map<String, dynamic> json) =>
      _$WhisperfirePatternFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfirePatternToJson(this);

  @override
  List<Object?> get props => [cycle, prognosis];
}

@JsonSerializable()
class WhisperfireAmbiguity extends Equatable {
  final String? warning;

  @JsonKey(name: 'missing_evidence')
  final List<String>? missingEvidence;

  const WhisperfireAmbiguity({
    this.warning,
    this.missingEvidence,
  });

  factory WhisperfireAmbiguity.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireAmbiguityFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireAmbiguityToJson(this);

  @override
  List<Object?> get props => [warning, missingEvidence];
}

@JsonSerializable()
class WhisperfireArchetype extends Equatable {
  final String label;
  final int weight; // 0-100

  const WhisperfireArchetype({
    required this.label,
    required this.weight,
  });

  factory WhisperfireArchetype.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireArchetypeFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireArchetypeToJson(this);

  @override
  List<Object?> get props => [label, weight];
}

@JsonSerializable()
class WhisperfireForecast extends Equatable {
  final String window; // e.g., "3-5 days"
  final String event; // e.g., "Escalation attempt"
  final int likelihood; // 0-100

  const WhisperfireForecast({
    required this.window,
    required this.event,
    required this.likelihood,
  });

  factory WhisperfireForecast.fromJson(Map<String, dynamic> json) =>
      _$WhisperfireForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperfireForecastToJson(this);

  @override
  List<Object?> get props => [window, event, likelihood];
}
