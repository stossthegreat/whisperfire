import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';
import '../atoms/atoms.dart';

class ArchetypePills extends StatelessWidget {
  final List<ArchetypeItem> archetypes;

  const ArchetypePills({
    super.key,
    required this.archetypes,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: WFDims.spacingS,
      runSpacing: WFDims.spacingS,
      children: archetypes.map((archetype) {
        return Pill(
          text: '${_getArchetypeEmoji(archetype.label)} ${archetype.label} — ${archetype.weight}%',
          backgroundColor: _getArchetypeColor(archetype.weight).withOpacity(0.2),
          textColor: _getArchetypeColor(archetype.weight),
        );
      }).toList(),
    );
  }

  String _getArchetypeEmoji(String label) {
    switch (label.toLowerCase()) {
      case 'gaslighting':
      case 'gaslighter':
        return '🤡';
      case 'love bombing':
      case 'love bomber':
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
      default:
        return '🦊';
    }
  }

  Color _getArchetypeColor(int weight) {
    if (weight >= 80) return WFColors.redPink[0]; // High risk - red
    if (weight >= 60) return const Color(0xFFF59E0B); // Medium risk - orange
    return WFColors.purple400; // Low risk - purple
  }
}

class ArchetypeItem {
  final String label;
  final int weight;

  const ArchetypeItem({
    required this.label,
    required this.weight,
  });
} 