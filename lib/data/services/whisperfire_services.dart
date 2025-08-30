import '../models/whisperfire_models.dart';

class WhisperfireServices {
  // Map goal to tab (as specified in brief)
  static String mapGoalToTab(String goal) {
    switch (goal.toLowerCase()) {
      case 'pattern':
      case 'pattern_analysis':
        return 'pattern';
      case 'scan':
      case 'quick_scan':
      default:
        return 'scan';
    }
  }

  // Build request payload (exact bodies as specified)
  static Map<String, dynamic> buildRequestPayload({
    required String tab,
    required String relationship,
    required String tone,
    required String contentType,
    String? subjectName,
    String? message, // For scan mode
    List<String>? messages, // For pattern mode
  }) {
    final basePayload = {
      'tab': tab,
      'relationship': relationship,
      'tone': _mapToneToBackend(tone),
      'content_type': contentType,
      'subject_name': subjectName,
    };

    if (tab == 'scan') {
      return {
        ...basePayload,
        'message': message ?? '',
      };
    } else if (tab == 'pattern') {
      return {
        ...basePayload,
        'messages': messages ?? [],
      };
    }

    throw ArgumentError('Invalid tab: $tab. Must be "scan" or "pattern"');
  }

  // Map frontend tone to backend tone
  static String _mapToneToBackend(String frontendTone) {
    switch (frontendTone.toLowerCase()) {
      case 'brutal':
        return 'savage';
      case 'soft':
        return 'soft';
      case 'clinical':
        return 'clinical';
      default:
        return 'savage'; // Default fallback
    }
  }

  // Parse metrics (returns both snake_case and camelCase keys)
  static Map<String, int> parseMetrics(WhisperfireMetrics metrics) {
    return {
      'red_flag': metrics.redFlag,
      'certainty': metrics.certainty,
      'viral_potential': metrics.viralPotential,
      'redFlag': metrics.redFlag,
      'viralPotential': metrics.viralPotential,
    };
  }

  // Extract profile tag (e.g., "🤡 Gaslighting • Partner • savage")
  static String extractProfileTag(WhisperfireResponse output) {
    final emoji = _getTacticEmoji(output.tactic.label);
    final tactic = output.tactic.label;
    final relationship = output.context.relationship;
    final tone = output.context.tone;
    return '$emoji $tactic • $relationship • $tone';
  }

  static String _getTacticEmoji(String tacticLabel) {
    switch (tacticLabel.toLowerCase()) {
      case 'gaslighting':
        return '🤡';
      case 'love bombing':
        return '💣';
      case 'darvo':
        return '⚔️';
      case 'triangulation':
        return '📐';
      case 'silent treatment':
        return '🤐';
      case 'hoovering':
        return '🌪️';
      case 'breadcrumbing':
        return '🍞';
      case 'future faking':
        return '🔮';
      case 'word salad':
        return '🥗';
      case 'projection':
        return '🪞';
      case 'none detected':
        return '✅';
      default:
        return '🎭';
    }
  }

  // Get receipts (2 for scan, 3-4 for pattern)
  static List<String> getReceipts(WhisperfireResponse output, String tab) {
    if (tab == 'scan') {
      return output.receipts.take(2).toList();
    } else if (tab == 'pattern') {
      return output.receipts.take(4).toList();
    }
    return output.receipts;
  }

  // Get pattern cycle (cycle or trigger_pattern_map)
  static String? getPatternCycle(
      WhisperfirePattern? pattern, String? triggerPatternMap) {
    return pattern?.cycle ?? triggerPatternMap;
  }

  // Split comeback reply (for future use)
  static Map<String, String> splitComebackReply(String reply) {
    // Keep for future - not currently used
    final lines =
        reply.split('\n').where((line) => line.trim().isNotEmpty).toList();
    return {
      'roast': lines.isNotEmpty ? lines[0] : '',
      'savageAlt': lines.length > 1 ? lines[1] : '',
      'iceCold': lines.length > 2 ? lines[2] : '',
    };
  }

  // Enforce client guards (clamp metrics, trim receipts, dedup reply lines)
  static WhisperfireResponse enforceClientGuards(WhisperfireResponse output) {
    // Clamp metrics to 0-100
    final clampedMetrics = WhisperfireMetrics(
      redFlag: output.metrics.redFlag.clamp(0, 100),
      certainty: output.metrics.certainty.clamp(0, 100),
      viralPotential: output.metrics.viralPotential.clamp(0, 100),
    );

    // Trim receipts based on tab
    final maxReceipts = output.context.tab == 'scan' ? 2 : 4;
    final trimmedReceipts = output.receipts.take(maxReceipts).toList();

    // Dedup reply lines
    final replyLines = output.suggestedReply.text
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toSet()
        .toList();

    final dedupedReply = WhisperfireSuggestedReply(
      style: output.suggestedReply.style,
      text: replyLines.join('\n'),
    );

    // Return guarded output
    return WhisperfireResponse(
      context: output.context,
      headline: output.headline,
      coreTake: output.coreTake,
      tactic: output.tactic,
      motives: output.motives,
      targeting: output.targeting,
      powerPlay: output.powerPlay,
      receipts: trimmedReceipts,
      nextMoves: output.nextMoves,
      suggestedReply: dedupedReply,
      safety: output.safety,
      metrics: clampedMetrics,
      pattern: output.pattern,
      ambiguity: output.ambiguity,
      hiddenAgenda: output.hiddenAgenda,
      archetypes: output.archetypes,
      triggerPatternMap: output.triggerPatternMap,
      contradictions: output.contradictions,
      weapons: output.weapons,
      forecast: output.forecast,
      counterIntervention: output.counterIntervention,
      longGame: output.longGame,
    );
  }
}
