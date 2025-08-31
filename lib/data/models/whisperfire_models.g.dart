// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whisperfire_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhisperfireResponse _$WhisperfireResponseFromJson(Map<String, dynamic> json) =>
    WhisperfireResponse(
      context:
          WhisperfireContext.fromJson(json['context'] as Map<String, dynamic>),
      headline: json['headline'] as String,
      coreTake: json['core_take'] as String,
      tactic:
          WhisperfireTactic.fromJson(json['tactic'] as Map<String, dynamic>),
      motives: json['motives'] as String,
      targeting: json['targeting'] as String,
      powerPlay: json['power_play'] as String,
      receipts:
          (json['receipts'] as List<dynamic>).map((e) => e as String).toList(),
      nextMoves: json['next_moves'] as String,
      suggestedReply: WhisperfireSuggestedReply.fromJson(
          json['suggested_reply'] as Map<String, dynamic>),
      safety:
          WhisperfireSafety.fromJson(json['safety'] as Map<String, dynamic>),
      metrics:
          WhisperfireMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      pattern: json['pattern'] == null
          ? null
          : WhisperfirePattern.fromJson(
              json['pattern'] as Map<String, dynamic>),
      ambiguity: json['ambiguity'] == null
          ? null
          : WhisperfireAmbiguity.fromJson(
              json['ambiguity'] as Map<String, dynamic>),
      hiddenAgenda: json['hidden_agenda'] as String?,
      archetypes: (json['archetypes'] as List<dynamic>?)
          ?.map((e) => WhisperfireArchetype.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggerPatternMap: json['trigger_pattern_map'] as String?,
      contradictions: (json['contradictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weapons:
          (json['weapons'] as List<dynamic>?)?.map((e) => e as String).toList(),
      forecast: (json['forecast'] as List<dynamic>?)
          ?.map((e) => WhisperfireForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      counterIntervention: json['counter_intervention'] as String?,
      longGame: json['long_game'] as String?,
    );

Map<String, dynamic> _$WhisperfireResponseToJson(
        WhisperfireResponse instance) =>
    <String, dynamic>{
      'context': instance.context,
      'headline': instance.headline,
      'core_take': instance.coreTake,
      'tactic': instance.tactic,
      'motives': instance.motives,
      'targeting': instance.targeting,
      'power_play': instance.powerPlay,
      'receipts': instance.receipts,
      'next_moves': instance.nextMoves,
      'suggested_reply': instance.suggestedReply,
      'safety': instance.safety,
      'metrics': instance.metrics,
      'pattern': instance.pattern,
      'ambiguity': instance.ambiguity,
      'hidden_agenda': instance.hiddenAgenda,
      'archetypes': instance.archetypes,
      'trigger_pattern_map': instance.triggerPatternMap,
      'contradictions': instance.contradictions,
      'weapons': instance.weapons,
      'forecast': instance.forecast,
      'counter_intervention': instance.counterIntervention,
      'long_game': instance.longGame,
    };

WhisperfireContext _$WhisperfireContextFromJson(Map<String, dynamic> json) =>
    WhisperfireContext(
      relationship: json['relationship'] as String,
      tone: json['tone'] as String,
      contentType: json['content_type'] as String,
      subjectName: json['subject_name'] as String?,
      tab: json['tab'] as String,
    );

Map<String, dynamic> _$WhisperfireContextToJson(WhisperfireContext instance) =>
    <String, dynamic>{
      'relationship': instance.relationship,
      'tone': instance.tone,
      'content_type': instance.contentType,
      'subject_name': instance.subjectName,
      'tab': instance.tab,
    };

WhisperfireTactic _$WhisperfireTacticFromJson(Map<String, dynamic> json) =>
    WhisperfireTactic(
      label: json['label'] as String,
      confidence: (json['confidence'] as num).toInt(),
    );

Map<String, dynamic> _$WhisperfireTacticToJson(WhisperfireTactic instance) =>
    <String, dynamic>{
      'label': instance.label,
      'confidence': instance.confidence,
    };

WhisperfireSuggestedReply _$WhisperfireSuggestedReplyFromJson(
        Map<String, dynamic> json) =>
    WhisperfireSuggestedReply(
      style: json['style'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$WhisperfireSuggestedReplyToJson(
        WhisperfireSuggestedReply instance) =>
    <String, dynamic>{
      'style': instance.style,
      'text': instance.text,
    };

WhisperfireSafety _$WhisperfireSafetyFromJson(Map<String, dynamic> json) =>
    WhisperfireSafety(
      riskLevel: json['risk_level'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$WhisperfireSafetyToJson(WhisperfireSafety instance) =>
    <String, dynamic>{
      'risk_level': instance.riskLevel,
      'notes': instance.notes,
    };

WhisperfireMetrics _$WhisperfireMetricsFromJson(Map<String, dynamic> json) =>
    WhisperfireMetrics(
      redFlag: (json['red_flag'] as num).toInt(),
      certainty: (json['certainty'] as num).toInt(),
      viralPotential: (json['viral_potential'] as num).toInt(),
    );

Map<String, dynamic> _$WhisperfireMetricsToJson(WhisperfireMetrics instance) =>
    <String, dynamic>{
      'red_flag': instance.redFlag,
      'certainty': instance.certainty,
      'viral_potential': instance.viralPotential,
    };

WhisperfirePattern _$WhisperfirePatternFromJson(Map<String, dynamic> json) =>
    WhisperfirePattern(
      cycle: json['cycle'] as String?,
      prognosis: json['prognosis'] as String?,
    );

Map<String, dynamic> _$WhisperfirePatternToJson(WhisperfirePattern instance) =>
    <String, dynamic>{
      'cycle': instance.cycle,
      'prognosis': instance.prognosis,
    };

WhisperfireAmbiguity _$WhisperfireAmbiguityFromJson(
        Map<String, dynamic> json) =>
    WhisperfireAmbiguity(
      warning: json['warning'] as String?,
      missingEvidence: (json['missing_evidence'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$WhisperfireAmbiguityToJson(
        WhisperfireAmbiguity instance) =>
    <String, dynamic>{
      'warning': instance.warning,
      'missing_evidence': instance.missingEvidence,
    };

WhisperfireArchetype _$WhisperfireArchetypeFromJson(
        Map<String, dynamic> json) =>
    WhisperfireArchetype(
      label: json['label'] as String,
      weight: (json['weight'] as num).toInt(),
    );

Map<String, dynamic> _$WhisperfireArchetypeToJson(
        WhisperfireArchetype instance) =>
    <String, dynamic>{
      'label': instance.label,
      'weight': instance.weight,
    };

WhisperfireForecast _$WhisperfireForecastFromJson(Map<String, dynamic> json) =>
    WhisperfireForecast(
      window: json['window'] as String,
      event: json['event'] as String,
      likelihood: (json['likelihood'] as num).toInt(),
    );

Map<String, dynamic> _$WhisperfireForecastToJson(
        WhisperfireForecast instance) =>
    <String, dynamic>{
      'window': instance.window,
      'event': instance.event,
      'likelihood': instance.likelihood,
    };
