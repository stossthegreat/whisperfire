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
          
          // Mentors grid (2 columns for beautiful square cards)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: WFDims.spacingL,
            crossAxisSpacing: WFDims.spacingL,
            childAspectRatio: 1.0, // Perfect square
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

  @override
  Widget build(BuildContext context) {
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
                      padding: EdgeInsets.zero, // Remove padding for full card usage
                      child: Column(
                        children: [
                          // Big portrait container (takes most of the card height)
                          Expanded(
                            flex: 4, // Takes 4/5 of the card height
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(WFDims.radiusLarge),
                                  topRight: Radius.circular(WFDims.radiusLarge),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withValues(alpha: 0.15),
                                    Colors.white.withValues(alpha: 0.05),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withValues(alpha: 0.2),
                                        border: Border.all(
                                          color: Colors.white.withValues(alpha: 0.4),
                                          width: 3,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(alpha: 0.2),
                                            blurRadius: 15,
                                            offset: const Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/mentors/${widget.mentor.id}.png',
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 120,
                                          errorBuilder: (context, error, stackTrace) {
                                            // Fallback to emoji if image fails to load
                                            return Center(
                                              child: Text(
                                                widget.mentor.avatar,
                                                style: const TextStyle(
                                                  fontSize: 60,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white.withValues(alpha: 0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        _getMentorSubtitle(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                          // Name section (takes 1/5 of the card height)
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: WFColors.gray800.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(WFDims.radiusLarge),
                                  bottomRight: Radius.circular(WFDims.radiusLarge),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  widget.mentor.name,
                                  style: WFTextStyles.h5.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
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

  String _getMentorSubtitle() {
    switch (widget.mentor.id) {
      case 'casanova':
        return 'Charm Master';
      case 'cleopatra':
        return 'Queen of Influence';
      case 'machiavelli':
        return 'Strategy Sage';
      case 'sun_tzu':
        return 'War Artisan';
      case 'marcus_aurelius':
        return 'Wisdom Keeper';
      case 'churchill':
        return 'Resolve Forger';
      default:
        return 'Legendary Mentor';
    }
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