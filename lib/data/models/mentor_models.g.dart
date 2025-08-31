// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorRequest _$MentorRequestFromJson(Map<String, dynamic> json) =>
    MentorRequest(
      mentor: json['mentor'] as String,
      preset: json['preset'] as String,
      userText: json['user_text'] as String,
      options: MentorOptions.fromJson(json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorRequestToJson(MentorRequest instance) =>
    <String, dynamic>{
      'mentor': instance.mentor,
      'preset': instance.preset,
      'user_text': instance.userText,
      'options': instance.options,
    };

MentorOptions _$MentorOptionsFromJson(Map<String, dynamic> json) =>
    MentorOptions(
      stream: json['stream'] as bool,
      safeMode: json['safe_mode'] as bool,
    );

Map<String, dynamic> _$MentorOptionsToJson(MentorOptions instance) =>
    <String, dynamic>{
      'stream': instance.stream,
      'safe_mode': instance.safeMode,
    };

MentorResponse _$MentorResponseFromJson(Map<String, dynamic> json) =>
    MentorResponse(
      success: json['success'] as bool,
      mentor: json['mentor'] as String,
      preset: json['preset'] as String,
      reply: json['reply'] as String,
      tips: (json['tips'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tokens: json['tokens'] == null
          ? null
          : MentorTokens.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorResponseToJson(MentorResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'mentor': instance.mentor,
      'preset': instance.preset,
      'reply': instance.reply,
      'tips': instance.tips,
      'tokens': instance.tokens,
    };

MentorTokens _$MentorTokensFromJson(Map<String, dynamic> json) => MentorTokens(
      prompt: (json['prompt'] as num).toInt(),
      completion: (json['completion'] as num).toInt(),
    );

Map<String, dynamic> _$MentorTokensToJson(MentorTokens instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'completion': instance.completion,
    };
