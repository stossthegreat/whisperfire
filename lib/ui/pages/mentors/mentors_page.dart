import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';
import '../../../data/services/cache_service.dart';
import '../../../data/models/mentor_models.dart';
import '../../../data/models/settings_models.dart';
import '../../../data/services/constants.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import 'mentor_detail_page.dart';

class MentorsPage extends ConsumerStatefulWidget {
  const MentorsPage({super.key});

  @override
  ConsumerState<MentorsPage> createState() => _MentorsPageState();
}

class _MentorsPageState extends ConsumerState<MentorsPage> {
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    await Future.delayed(const Duration(milliseconds: 300));
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
          ? const _LoadingShell()
          : const _MentorsContent(),
      ),
    );
  }
}

class _MentorsContent extends ConsumerWidget {
  const _MentorsContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(WFDims.paddingL),
      child: Column(
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
                    Icons.psychology,
                    size: 40,
                    color: WFColors.textPrimary,
                  ),
                ),
                const SizedBox(height: WFDims.spacingL),
                Text('Choose Your AI Mentor', style: WFTextStyles.h1),
                const SizedBox(height: WFDims.spacingS),
                Text(
                  'Select a legendary defender to guide your training',
                  style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: WFDims.spacingXXL),
          
          // Mentors grid (2 columns)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: WFDims.spacingL,
            crossAxisSpacing: WFDims.spacingL,
            childAspectRatio: 0.8,
            children: MentorConstants.mentors.map((mentor) {
              return _MentorCard(mentor: mentor);
            }).toList(),
          ),
          
          const SizedBox(height: WFDims.spacingXXL),
        ],
      ),
    );
  }
}

class _MentorCard extends ConsumerWidget {
  final Mentor mentor;
  
  const _MentorCard({required this.mentor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradient = LinearGradient(
      colors: mentor.color.map((c) => Color(int.parse(c.replaceFirst('#', '0xFF')))).toList(),
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return GestureDetector(
      onTap: () => _selectMentor(context, ref),
      child: GlassCard(
        padding: const EdgeInsets.all(WFDims.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(30),
                boxShadow: WFShadows.glass,
              ),
              child: Center(
                child: Text(mentor.avatar, style: const TextStyle(fontSize: 28)),
              ),
            ),
            const SizedBox(height: WFDims.spacingM),
            Text(mentor.name, style: WFTextStyles.h4.copyWith(color: WFColors.purple400)),
            const SizedBox(height: 4),
            Text(
              mentor.subtitle,
              style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _selectMentor(BuildContext context, WidgetRef ref) {
    ref.read(selectedMentorProvider.notifier).state = mentor;
    
    // Initialize with greeting
    ref.read(mentorMessagesProvider(mentor.id).notifier).addGreeting(mentor.greeting);
    
    // Navigate to mentor detail
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MentorDetailPage(mentor: mentor),
      ),
    );
  }
}

// ===== LOADING SHELL =====
class _LoadingShell extends StatelessWidget {
  const _LoadingShell();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(WFColors.purple400),
          ),
          SizedBox(height: WFDims.spacingL),
          Text(
            'Loading mentors...',
            style: TextStyle(
              color: WFColors.textTertiary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
} 