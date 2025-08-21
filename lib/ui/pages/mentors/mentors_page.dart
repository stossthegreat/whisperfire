import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/services/constants.dart';
import '../../../data/models/mentor_models.dart';
import '../../../core/theme/theme.dart';
import '../../atoms/glass_card.dart';
import 'mentor_detail_page.dart';
import '../../../widgets/app_header.dart';

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
      appBar: const AppHeader(),
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
          
          // Mentors grid (3 columns for smaller cards)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: WFDims.spacingM,
            crossAxisSpacing: WFDims.spacingM,
            childAspectRatio: 0.85,
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

class _MentorCard extends ConsumerStatefulWidget {
  final Mentor mentor;
  
  const _MentorCard({required this.mentor});

  @override
  ConsumerState<_MentorCard> createState() => _MentorCardState();
}

class _MentorCardState extends ConsumerState<_MentorCard> 
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Color _getMentorColor() {
    switch (widget.mentor.id) {
      case 'casanova':
        return const Color(0xFFEC4899); // Pink for charm
      case 'cleopatra':
        return const Color(0xFFF59E0B); // Gold for influence
      case 'machiavelli':
        return const Color(0xFF6B7280); // Gray for strategy
      case 'sun_tzu':
        return const Color(0xFFEF4444); // Red for warfare
      case 'marcus_aurelius':
        return const Color(0xFF8B5CF6); // Purple for wisdom
      case 'churchill':
        return const Color(0xFFEA580C); // Orange for resolve
      default:
        return WFColors.purple400;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mentorColor = _getMentorColor();
    
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _isHovered ? 1.05 : _scaleAnimation.value,
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: GestureDetector(
                  onTap: () => _selectMentor(context),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: GlassCard(
                      padding: const EdgeInsets.all(WFDims.paddingM),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Animated avatar container
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: _isHovered ? 50 : 45,
                            height: _isHovered ? 50 : 45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  mentorColor,
                                  mentorColor.withValues(alpha: 0.7),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: _isHovered 
                                ? [
                                    BoxShadow(
                                      color: mentorColor.withValues(alpha: 0.4),
                                      blurRadius: 15,
                                      spreadRadius: 2,
                                    )
                                  ]
                                : WFShadows.glass,
                            ),
                            child: Center(
                              child: AnimatedScale(
                                scale: _isHovered ? 1.1 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: Text(
                                  widget.mentor.avatar, 
                                  style: const TextStyle(fontSize: 24)
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: WFDims.spacingS),
                          
                          // Mentor name with color
                          Text(
                            widget.mentor.name, 
                            style: WFTextStyles.h5.copyWith(
                              color: mentorColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          
                          const SizedBox(height: 2),
                          
                          // Subtitle
                          Text(
                            widget.mentor.subtitle,
                            style: WFTextStyles.bodySmall.copyWith(
                              color: WFColors.textTertiary,
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectMentor(BuildContext context) {
    // Add haptic feedback
    HapticFeedback.lightImpact();
    
    ref.read(selectedMentorProvider.notifier).state = widget.mentor;
    
    // Initialize with greeting
    ref.read(mentorMessagesProvider(widget.mentor.id).notifier).addGreeting(widget.mentor.greeting);
    
    // Navigate to mentor detail
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MentorDetailPage(mentor: widget.mentor),
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