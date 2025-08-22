import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/app_header.dart';
import '../../atoms/atoms.dart';
import 'sub_pages/account_settings_page.dart';
import 'sub_pages/appearance_settings_page.dart';
import 'sub_pages/notification_settings_page.dart';
import 'sub_pages/privacy_settings_page.dart';
import 'sub_pages/support_info_page.dart';
import 'sub_pages/legal_documents_page.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: const AppHeader(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Icons.settings,
                        size: 40,
                        color: WFColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: WFDims.spacingL),
                    Text('SETTINGS', style: WFTextStyles.h1),
                    const SizedBox(height: WFDims.spacingS),
                    Text(
                      'Customize your Beguile AI experience',
                      style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingXXL),
              
              // Settings Categories
              _buildSettingsCategory(
                context,
                'Account & Privacy',
                'Manage your account and data',
                Icons.person,
                [
                  _buildSettingsTile(
                    context,
                    'Account Settings',
                    'Profile, deletion, data management',
                    Icons.account_circle,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AccountSettingsPage()),
                    ),
                  ),
                  _buildSettingsTile(
                    context,
                    'Privacy & Security',
                    'Data sharing, permissions, security',
                    Icons.security,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PrivacySettingsPage()),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              _buildSettingsCategory(
                context,
                'Appearance & Experience',
                'Customize how the app looks and feels',
                Icons.palette,
                [
                  _buildSettingsTile(
                    context,
                    'Appearance',
                    'Theme, colors, fonts, animations',
                    Icons.dark_mode,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AppearanceSettingsPage()),
                    ),
                  ),
                  _buildSettingsTile(
                    context,
                    'Haptics & Sound',
                    'Vibration feedback and audio',
                    Icons.vibration,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationSettingsPage()),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              _buildSettingsCategory(
                context,
                'Notifications & Reminders',
                'Stay updated and motivated',
                Icons.notifications,
                [
                  _buildSettingsTile(
                    context,
                    'Study Reminders',
                    'Daily practice notifications',
                    Icons.schedule,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationSettingsPage()),
                    ),
                  ),
                  _buildSettingsTile(
                    context,
                    'Achievement Alerts',
                    'Level up and milestone notifications',
                    Icons.emoji_events,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationSettingsPage()),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              _buildSettingsCategory(
                context,
                'Support & Information',
                'Get help and learn more',
                Icons.help,
                [
                  _buildSettingsTile(
                    context,
                    'Help & Support',
                    'FAQs, tutorials, contact support',
                    Icons.support_agent,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SupportInfoPage()),
                    ),
                  ),
                  _buildSettingsTile(
                    context,
                    'About Beguile AI',
                    'Version info, credits, legal',
                    Icons.info,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SupportInfoPage()),
                    ),
                  ),
                ],
              ),
              
              // Legal Section
              _buildSettingsCategory(
                context,
                'Legal & Policies',
                'Read important legal documents',
                Icons.description,
                [
                  _buildSettingsTile(
                    context,
                    'Terms of Service',
                    'Read our complete terms of service',
                    Icons.description,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LegalDocumentsPage(documentType: 'terms'),
                      ),
                    ),
                  ),
                  _buildSettingsTile(
                    context,
                    'Privacy Policy',
                    'Read our complete privacy policy',
                    Icons.privacy_tip,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LegalDocumentsPage(documentType: 'privacy'),
                      ),
                    ),
                  ),
                  _buildSettingsTile(
                    context,
                    'Disclaimer & Safety',
                    'Important safety information and disclaimers',
                    Icons.warning,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LegalDocumentsPage(documentType: 'disclaimer'),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingXXL),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCategory(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    List<Widget> children,
  ) {
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
          const SizedBox(height: WFDims.spacingS),
          Text(subtitle, style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
          const SizedBox(height: WFDims.spacingL),
          ...children.expand((child) => [
            child,
            if (child != children.last) const SizedBox(height: WFDims.spacingM),
          ]).toList(),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
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
                  Text(subtitle, style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
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
} 