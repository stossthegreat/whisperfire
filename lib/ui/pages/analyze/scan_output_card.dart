import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../../data/models/whisperfire_models.dart';
import '../../../data/services/whisperfire_services.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';

class ScanOutputCard extends StatelessWidget {
  final WhisperfireResponse result;
  
  const ScanOutputCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final profileTag = WhisperfireServices.extractProfileTag(result);
    final receipts = WhisperfireServices.getReceipts(result, 'scan');

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TopLine: 🔍 SCAN — <Archetype Nickname> + Red Flag bar
          TopLine(
            tabLabel: '🔍 SCAN — ${_getArchetypeNickname(result.tactic.label)}',
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
          
          // 💥 Headline
          _buildSection('💥', 'Headline', result.headline),
          
          // 🕵️ The Read
          _buildSection('🕵️', 'The Read', result.coreTake),
          
          // 🎯 Identified Tactic
          _buildSection(
            '🎯', 
            'Identified Tactic', 
            '${result.tactic.label} (${result.tactic.confidence}%)'
          ),
          
          // 💡 Power Play (blockquote + faint mirror)
          _buildPowerPlaySection(result),
          
          // 🎭 Long Game Warning
          _buildSection('🎭', 'Long Game Warning', result.motives),
          
          // 📸 Receipts (exactly 2)
          _buildReceiptsSection(receipts),
          
          const SizedBox(height: WFDims.sectionSpacing),
          const DividerFaint(),
          
          // Footer (muted)
          _buildFooter(result),
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
        Text(
          content, 
          style: WFTextStyles.bodyMedium.copyWith(
            fontSize: 18, // Bigger text
            fontWeight: FontWeight.w600, // Thicker text
            color: Colors.black, // Black text for output cards
          )
        ),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _buildPowerPlaySection(WhisperfireResponse result) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: '💡', title: 'Power Play'),
        const SizedBox(height: WFDims.titleBodySpacing),
        Container(
          padding: const EdgeInsets.all(WFDims.paddingM),
          decoration: BoxDecoration(
            color: WFColors.gray800.withOpacity(0.3),
            borderRadius: BorderRadius.circular(WFDims.radiusSmall),
            border: Border(
              left: BorderSide(color: WFColors.purple400, width: 3),
            ),
          ),
          child: Text(
            result.powerPlay, 
            style: WFTextStyles.bodyMedium.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: 18, // Bigger text
              fontWeight: FontWeight.w600, // Thicker text
              color: Colors.black, // Black text for output cards
            )
          ),
        ),
        const SizedBox(height: WFDims.spacingS),
        Text(
          result.suggestedReply.text.split('\n').first, // First line
          style: WFTextStyles.bodySmall.copyWith(
            color: Colors.black, // Black text for output cards
            fontSize: 16, // Bigger text
            fontWeight: FontWeight.w600, // Thicker text
          ),
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
        ReceiptsList(receipts: receipts, mode: 'scan'),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _buildFooter(WhisperfireResponse result) {
    return Column(
      children: [
        KVRow(label: '🎯 Targeting:', value: result.targeting),
        KVRow(label: '⏭ Next Moves:', value: result.nextMoves),
        KVRow(label: '🛡 Safety:', value: '${result.safety.riskLevel} — ${result.safety.notes}'),
      ],
    );
  }

  String _getArchetypeNickname(String tacticLabel) {
    switch (tacticLabel.toLowerCase()) {
      case 'gaslighting':
        return 'Gaslight Gourmet';
      case 'love bombing':
        return 'Love Bomber';
      case 'darvo':
        return 'DARVO Master';
      case 'triangulation':
        return 'Triangle Architect';
      case 'silent treatment':
        return 'Silent Assassin';
      case 'hoovering':
        return 'Hoover Hero';
      case 'breadcrumbing':
        return 'Breadcrumb Baker';
      case 'none detected':
        return 'Clean Scan';
      default:
        return 'Pattern Detected';
    }
  }
} 