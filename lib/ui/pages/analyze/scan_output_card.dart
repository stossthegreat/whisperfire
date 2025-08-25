import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final original = receipts.isNotEmpty ? receipts.first : '';
    final whyBullets = _splitBullets(result.powerPlay); // used for “Why it works”
    final principle = (result.counterIntervention ?? '').trim();

    return GlassCard(
      child: Stack(
        children: [
          // CONTENT
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top line with Red Flag + share button
                TopLine(
                  tabLabel: '🔍 SCAN — ${_nickname(result.tactic.label)}',
                  profileTag: profileTag,
                  rightWidget: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 120,
                        child: MetricBar(
                          label: 'Red Flag',
                          value: result.metrics.redFlag,
                          color: WFColors.redPink[0],
                        ),
                      ),
                      const SizedBox(width: 8),
                      _shareButton(context, _shareTextScan(result, original)),
                    ],
                  ),
                ),

                // 1) 💥 Headline (TOP)
                _section('💥', 'Headline', result.headline),

                // 2) 📨 Message (you wrote)
                _section('📨', 'Message (you wrote)', original),

                // 3) 💀 What actually happened (plain English)
                _section('💀', 'What actually happened', result.coreTake),

                // 4) ⚠️ Mistake (use motives if it carries the failure idea, else fallback)
                if (result.motives.trim().isNotEmpty)
                  _section('⚠️', 'Mistake', result.motives),

                // 5) 🔥 What you should’ve said (one lethal line or first line)
                _section('🔥', 'What you should’ve said', _oneLine(result.suggestedReply.text)),

                // 6) ✨ Why it works (3–5 bullets from power_play)
                if (whyBullets.isNotEmpty)
                  _bullets('✨', 'Why it works', whyBullets),

                // 7) 🚀 Principle for next time (counter_intervention)
                if (principle.isNotEmpty)
                  _section('🚀', 'Principle for next time', principle),

                const SizedBox(height: WFDims.sectionSpacing),
                const DividerFaint(),

                // Footer brand
                _brandFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ——— helpers ———

  IconButton _shareButton(BuildContext ctx, String text) {
    return IconButton(
      tooltip: 'Share',
      icon: const Icon(Icons.ios_share_rounded, size: 20, color: Colors.black),
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: text));
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text('Copied to clipboard')),
        );
      },
    );
  }

  String _shareTextScan(WhisperfireResponse r, String original) {
    final why = _splitBullets(r.powerPlay).join('\n• ');
    final principle = (r.counterIntervention ?? '').trim();
    return '''
[Whisperfire • Scan]

💥 ${r.headline}

📨 You wrote:
$original

💀 What happened:
${r.coreTake}

⚠️ Mistake:
${r.motives}

🔥 Rewrite:
${_oneLine(r.suggestedReply.text)}

✨ Why it works:
${why.isNotEmpty ? '• $why' : '-'}

🚀 Principle:
${principle.isNotEmpty ? principle : '-'}
'''.trim();
  }

  String _nickname(String label) {
    switch (label.toLowerCase()) {
      case 'gaslighting': return 'Gaslight Gourmet';
      case 'love bombing': return 'Love Bomber';
      case 'darvo': return 'DARVO Master';
      case 'triangulation': return 'Triangle Architect';
      case 'silent treatment': return 'Silent Assassin';
      case 'hoovering': return 'Hoover Hero';
      case 'breadcrumbing': return 'Breadcrumb Baker';
      case 'none detected': return 'Clean Scan';
      default: return 'Pattern Detected';
    }
  }

  List<String> _splitBullets(String block) {
    final lines = block
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    return lines.take(5).toList();
  }

  String _oneLine(String s) => s.replaceAll(RegExp(r'\s+'), ' ').trim();

  Widget _section(String emoji, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: emoji, title: title),
        const SizedBox(height: WFDims.titleBodySpacing),
        Text(
          content,
          style: WFTextStyles.bodyMedium.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _bullets(String emoji, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(emoji: emoji, title: title),
        const SizedBox(height: WFDims.titleBodySpacing),
        ...items.map((b) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4, height: 4,
                margin: const EdgeInsets.only(top: 10, right: WFDims.spacingS),
                decoration: BoxDecoration(
                  color: WFColors.purple400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Text(
                  b,
                  style: WFTextStyles.bodyMedium.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )),
        const SizedBox(height: WFDims.sectionSpacing),
      ],
    );
  }

  Widget _brandFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.local_fire_department_rounded, size: 16, color: Colors.black),
          const SizedBox(width: 6),
          Text(
            'Whisperfire • The Seduction Engine',
            style: WFTextStyles.bodySmall.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
