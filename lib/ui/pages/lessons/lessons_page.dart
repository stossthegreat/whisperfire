import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';
import '../../../data/services/cache_service.dart';
import '../../../data/models/settings_models.dart';
import '../../atoms/atoms.dart';
import '../../shared/loading_shell.dart';
import '../../molecules/molecules.dart';

class LessonsPage extends ConsumerStatefulWidget {
  const LessonsPage({super.key});

  @override
  ConsumerState<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends ConsumerState<LessonsPage> {
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    // Simulate loading worlds/lessons
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WFColors.base,
      body: SafeArea(
        child: _isLoading 
          ? const LoadingShell()
          : const _LessonsContent(),
      ),
    );
  }
}

class _LessonsContent extends StatelessWidget {
  const _LessonsContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(WFDims.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: WFGradients.purpleGradient,
                    borderRadius: BorderRadius.circular(WFDims.radiusXLarge),
                    boxShadow: WFShadows.purpleGlow,
                  ),
                  child: Icon(
                    Icons.shield,
                    size: 40,
                    color: WFColors.textPrimary,
                  ),
                ),
                const SizedBox(height: WFDims.spacingL),
                Text('Defense Training', style: WFTextStyles.h1),
                const SizedBox(height: WFDims.spacingS),
                Text(
                  'Master the art of psychological self-defense',
                  style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: WFDims.spacingXXL),
          
          // Worlds grid placeholder
          Text('Training Worlds', style: WFTextStyles.h3),
          const SizedBox(height: WFDims.spacingL),
          
          // Grid of world cards
          ...List.generate(6, (index) => Padding(
            padding: EdgeInsets.only(bottom: WFDims.spacingL),
            child: GlassCard(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: index % 2 == 0 ? WFGradients.tealPurple : WFGradients.redPink,
                      borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                    ),
                    child: Center(
                      child: Text(
                        ['💫', '🎭', '⏰', '🧠', '❄️', '🎪'][index],
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(width: WFDims.spacingL),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ['Seductive Gravity', 'Frame Control', 'Scarcity & Obsession', 
                           'Psychological Warfare', 'Cold Power', 'Deception & Camouflage'][index],
                          style: WFTextStyles.h4,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ['Recognize Charm Tactics', 'Conversational Defense', 'Emotional Manipulation',
                           'Advanced Manipulation', 'Status Games', 'Truth vs Lies'][index],
                          style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
                        ),
                        const SizedBox(height: WFDims.spacingS),
                        Text(
                          '${[8, 6, 7, 9, 5, 10][index]} lessons',
                          style: WFTextStyles.labelMedium.copyWith(color: WFColors.purple400),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    index < 2 ? Icons.chevron_right : Icons.lock,
                    color: index < 2 ? WFColors.purple400 : WFColors.gray500,
                  ),
                ],
              ),
            ),
          )),
          
          const SizedBox(height: WFDims.spacingXXL),
        ],
      ),
    );
  }
} 