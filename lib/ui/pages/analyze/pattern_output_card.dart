import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../../data/models/whisperfire_models.dart';
import '../../../data/services/whisperfire_services.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';

class PatternOutputCard extends StatelessWidget {
  final WhisperfireResponse result;
  
  const PatternOutputCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final profileTag = WhisperfireServices.extractProfileTag(result);
    final receipts = WhisperfireServices.getReceipts(result, 'pattern');

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TopLine: 🕵️‍♀️ PATTERN — <Archetype Nickname> + Red Flag bar
          TopLine(
            tabLabel: '🕵️‍♀️ PATTERN — ${_getArchetypeNickname(result.tactic.label)}',
            profileTag: profileTag,
            rightWidget: SizedBox(
              width: 120,
              child: MetricBar(
                label: 'Red Flag',
                value: result.metrics.redFlag,
                color: WFColors.redPink[0],
              ),
            ),
          ),
          
          // 1. 💥 Headline
          _buildSection('💥', 'Headline', result.headline),
          
          // 2. 🔍 Hidden Agenda Scan
          if (result.hiddenAgenda != null)
            _buildSection('🔍', 'Hidden Agenda Scan', result.hiddenAgenda!)
          else
            _buildSection('🔍', 'Hidden Agenda Scan', result.coreTake),
          
          // 3. 🧬 Archetype DNA Match
          if (result.archetypes != null && result.archetypes!.isNotEmpty)
            _buildArchetypesSection(result.archetypes!),
          
          // 4. 📊 Trigger Pattern Map
          if (result.pattern?.cycle != null || result.triggerPatternMap != null)
            _buildSection(
              '📊', 
              'Trigger Pattern Map', 
              WhisperfireServices.getPatternCycle(result.pattern, result.triggerPatternMap) ?? 'No clear pattern detected'
            ),
          
          // 5. 🎯 Identified Tactic
          _buildSection(
            '🎯', 
            'Identified Tactic', 
            '${result.tactic.label} (${result.tactic.confidence}%)'
          ),
          
          // 6. 🚨 Contradiction Audit
          if (result.contradictions != null && result.contradictions!.isNotEmpty)
            _buildListSection('🚨', 'Contradiction Audit', result.contradictions!),
          
          // 7. 🛠 Psychological Weapons Arsenal
          if (result.weapons != null && result.weapons!.isNotEmpty)
            _buildListSection('🛠', 'Psychological Weapons Arsenal', result.weapons!),
          
          // 8. 🔮 Future Shock Forecast (7–14d)
          if (result.forecast != null && result.forecast!.isNotEmpty)
            _buildForecastSection(result.forecast!),
          
          // 9. 🧠 Risk Index
          _buildSection('🧠', 'Risk Index', '${result.safety.riskLevel} — ${result.safety.notes}'),
          
          // 10. 🛡 Counter-Intervention Blueprint
          _buildSection(
            '🛡', 
            'Counter-Intervention Blueprint', 
            result.counterIntervention ?? result.powerPlay
          ),
          
          // 11. 🎯 Long Game Revelation
          _buildSection(
            '🎯', 
            'Long Game Revelation', 
            result.longGame ?? result.pattern?.prognosis ?? result.motives
          ),
          
          // 12. 📸 Receipts (3–4 ordered)
          _buildReceiptsSection(receipts),
          
          // 13. 💬 Boundary Script
          _buildBoundaryScriptSection(result),
          
        ],
      ),
    );
  }

  Widget _buildSection(String emoji, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: emoji, title: title),
        const SizedBox(height: WFDims.titleBodySpacing),
        Text(content, style: WFTextStyles.bodyMedium),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _buildListSection(String emoji, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: emoji, title: title),
        const SizedBox(height: WFDims.titleBodySpacing),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 4,
                margin: const EdgeInsets.only(top: 8, right: WFDims.spacingS),
                decoration: BoxDecoration(
                  color: WFColors.purple400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Text(item, style: WFTextStyles.bodyMedium),
              ),
            ],
          ),
        )).toList(),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _buildArchetypesSection(List<WhisperfireArchetype> archetypes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: '🧬', title: 'Archetype DNA Match'),
        const SizedBox(height: WFDims.titleBodySpacing),
        ArchetypePills(
          archetypes: archetypes.map((a) => ArchetypeItem(
            label: a.label,
            weight: a.weight,
          )).toList(),
        ),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _buildForecastSection(List<WhisperfireForecast> forecasts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: '🔮', title: 'Future Shock Forecast (7–14d)'),
        const SizedBox(height: WFDims.titleBodySpacing),
        ForecastList(
          forecasts: forecasts.map((f) => ForecastItem(
            window: f.window,
            event: f.event,
            likelihood: f.likelihood,
          )).toList(),
        ),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _buildReceiptsSection(List<String> receipts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: '📸', title: 'Receipts'),
        const SizedBox(height: WFDims.titleBodySpacing),
        ReceiptsList(receipts: receipts, mode: 'pattern'),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _buildBoundaryScriptSection(WhisperfireResponse result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: '💬', title: 'Boundary Script'),
        const SizedBox(height: WFDims.titleBodySpacing),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(WFDims.paddingM),
          decoration: BoxDecoration(
            color: WFColors.gray800.withOpacity(0.3),
            borderRadius: BorderRadius.circular(WFDims.radiusSmall),
            border: Border(
              left: BorderSide(color: WFColors.purple400, width: 3),
            ),
          ),
          child: Text(
            result.suggestedReply.text,
            style: WFTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  String _getArchetypeNickname(String tacticLabel) {
    switch (tacticLabel.toLowerCase()) {
      case 'gaslighting':
        return 'Reality Distorter';
      case 'love bombing':
        return 'Emotional Bomber';
      case 'darvo':
        return 'Victim Flipper';
      case 'triangulation':
        return 'Drama Architect';
      case 'silent treatment':
        return 'Ice Wall Builder';
      case 'hoovering':
        return 'Vacuum Operator';
      case 'breadcrumbing':
        return 'Hope Dangler';
      case 'none detected':
        return 'Clean Pattern';
      default:
        return 'Pattern Master';
    }
  }
} 