import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../../atoms/atoms.dart';
import 'legal_documents_page.dart';

class SupportInfoPage extends ConsumerWidget {
  const SupportInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: WFColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Support & Info', style: WFTextStyles.h3),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Help Center Section
              _buildSection(
                'Help Center',
                Icons.help,
                [
                  _buildHelpTile(
                    'Getting Started',
                    'Learn the basics of using Beguile AI',
                    Icons.school,
                    () => _openHelpTopic(context, 'getting_started'),
                  ),
                  _buildHelpTile(
                    'Lesson Navigation',
                    'How to navigate through lessons and categories',
                    Icons.navigation,
                    () => _openHelpTopic(context, 'lesson_navigation'),
                  ),
                  _buildHelpTile(
                    'Progress Tracking',
                    'Understanding your learning progress and XP',
                    Icons.trending_up,
                    () => _openHelpTopic(context, 'progress_tracking'),
                  ),
                  _buildHelpTile(
                    'Common Issues',
                    'Solutions to frequently encountered problems',
                    Icons.bug_report,
                    () => _openHelpTopic(context, 'common_issues'),
                  ),
                  _buildHelpTile(
                    'FAQ',
                    'Frequently asked questions and answers',
                    Icons.question_answer,
                    () => _openHelpTopic(context, 'faq'),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Contact Support Section
              _buildSection(
                'Contact Support',
                Icons.support_agent,
                [
                  _buildActionTile(
                    'Live Chat',
                    'Chat with our support team in real-time',
                    Icons.chat,
                    () => _openLiveChat(context),
                  ),
                  _buildActionTile(
                    'Email Support',
                    'Send us an email for detailed assistance',
                    Icons.email,
                    () => _sendEmail(context),
                  ),
                  _buildActionTile(
                    'Report a Bug',
                    'Report technical issues or bugs',
                    Icons.bug_report,
                    () => _reportBug(context),
                  ),
                  _buildActionTile(
                    'Feature Request',
                    'Suggest new features or improvements',
                    Icons.lightbulb,
                    () => _requestFeature(context),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // App Information Section
              _buildSection(
                'App Information',
                Icons.info,
                [
                  _buildInfoTile('App Version', '1.0.0'),
                  _buildInfoTile('Build Number', 'Phase 7 Development'),
                  _buildInfoTile('Last Updated', 'January 2025'),
                  _buildInfoTile('Developer', 'Beguile AI Team'),
                  _buildInfoTile('Platform', 'Flutter'),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Legal & Policies Section
              _buildSection(
                'Legal & Policies',
                Icons.description,
                [
                  _buildActionTile(
                    'Privacy Policy',
                    'How we handle your data and privacy',
                    Icons.privacy_tip,
                    () => _openPrivacyPolicy(context),
                  ),
                  _buildActionTile(
                    'Terms of Service',
                    'Terms and conditions for using Beguile AI',
                    Icons.description,
                    () => _openTermsOfService(context),
                  ),
                  _buildActionTile(
                    'Cookie Policy',
                    'Information about our use of cookies',
                    Icons.cookie,
                    () => _openCookiePolicy(context),
                  ),
                  _buildActionTile(
                    'Data Processing',
                    'How your data is processed and stored',
                    Icons.storage,
                    () => _openDataProcessing(context),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Community Section
              _buildSection(
                'Community',
                Icons.people,
                [
                  _buildActionTile(
                    'User Forum',
                    'Connect with other Beguile AI users',
                    Icons.forum,
                    () => _openUserForum(context),
                  ),
                  _buildActionTile(
                    'Discord Server',
                    'Join our Discord community',
                    Icons.discord,
                    () => _openDiscord(context),
                  ),
                  _buildActionTile(
                    'Social Media',
                    'Follow us on social platforms',
                    Icons.share,
                    () => _openSocialMedia(context),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingXXL),

              // Rate App Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _rateApp(context),
                  icon: Icon(Icons.star, color: Colors.white),
                  label: Text(
                    'Rate Beguile AI',
                    style: WFTextStyles.button.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: WFColors.purple400, size: 24),
              const SizedBox(width: WFDims.spacingS),
              Text(title, style: WFTextStyles.h3),
            ],
          ),
          const SizedBox(height: WFDims.spacingL),
          ...children.expand((child) => [
            child,
            if (child != children.last) const SizedBox(height: WFDims.spacingM),
          ]).toList(),
        ],
      ),
    );
  }

  Widget _buildHelpTile(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(WFDims.radiusMedium),
      child: Container(
        padding: const EdgeInsets.all(WFDims.paddingM),
        decoration: BoxDecoration(
          color: WFColors.gray800.withOpacity(0.3),
          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
          border: Border.all(color: WFColors.glassBorder.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: WFColors.purple400, size: 20),
            const SizedBox(width: WFDims.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: WFTextStyles.labelLarge),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: WFColors.textTertiary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(WFDims.radiusMedium),
      child: Container(
        padding: const EdgeInsets.all(WFDims.paddingM),
        decoration: BoxDecoration(
          color: WFColors.gray800.withOpacity(0.3),
          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
          border: Border.all(color: WFColors.glassBorder.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: WFColors.purple400, size: 20),
            const SizedBox(width: WFDims.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: WFTextStyles.labelLarge),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: WFColors.textTertiary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(WFDims.paddingM),
      decoration: BoxDecoration(
        color: WFColors.gray800.withOpacity(0.3),
        borderRadius: BorderRadius.circular(WFDims.radiusMedium),
        border: Border.all(color: WFColors.glassBorder.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: WFTextStyles.labelLarge),
          ),
          Text(value, style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textSecondary)),
        ],
      ),
    );
  }

  void _openHelpTopic(BuildContext context, String topic) {
    // TODO: Implement help topic navigation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Help topic: $topic - coming soon')),
    );
  }

  void _openLiveChat(BuildContext context) {
    // TODO: Implement live chat
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Live chat coming soon')),
    );
  }

  void _sendEmail(BuildContext context) {
    // TODO: Implement email support
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email support coming soon')),
    );
  }

  void _reportBug(BuildContext context) {
    // TODO: Implement bug reporting
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bug reporting coming soon')),
    );
  }

  void _requestFeature(BuildContext context) {
    // TODO: Implement feature requests
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Feature requests coming soon')),
    );
  }

  void _openPrivacyPolicy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LegalDocumentsPage(documentType: 'privacy'),
      ),
    );
  }

  void _openTermsOfService(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LegalDocumentsPage(documentType: 'terms'),
      ),
    );
  }

  void _openCookiePolicy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LegalDocumentsPage(documentType: 'disclaimer'),
      ),
    );
  }

  void _openDataProcessing(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LegalDocumentsPage(documentType: 'privacy'),
      ),
    );
  }

  void _openUserForum(BuildContext context) {
    // TODO: Open user forum
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('User forum coming soon')),
    );
  }

  void _openDiscord(BuildContext context) {
    // TODO: Open Discord
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Discord server coming soon')),
    );
  }

  void _openSocialMedia(BuildContext context) {
    // TODO: Open social media
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Social media coming soon')),
    );
  }

  void _rateApp(BuildContext context) {
    // TODO: Implement app rating
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('App rating coming soon')),
    );
  }
} 