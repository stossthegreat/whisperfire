import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../../atoms/atoms.dart';

class PrivacySettingsPage extends ConsumerStatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  ConsumerState<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends ConsumerState<PrivacySettingsPage> {
  bool _analyticsEnabled = true;
  bool _crashReporting = true;
  bool _dataSharing = false;
  bool _locationServices = false;
  bool _cameraPermission = false;
  bool _microphonePermission = false;
  bool _twoFactorAuth = false;
  String _dataRetention = '30_days';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: WFColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Privacy & Security', style: WFTextStyles.h3),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Data Collection Section
              _buildSection(
                'Data Collection',
                Icons.data_usage,
                [
                  _buildToggleTile(
                    'Analytics & Usage Data',
                    'Help improve the app by sharing anonymous usage statistics',
                    _analyticsEnabled,
                    (value) => setState(() => _analyticsEnabled = value),
                  ),
                  _buildToggleTile(
                    'Crash Reporting',
                    'Automatically report app crashes to help fix issues',
                    _crashReporting,
                    (value) => setState(() => _crashReporting = value),
                  ),
                  _buildToggleTile(
                    'Data Sharing',
                    'Allow sharing of anonymized data for research purposes',
                    _dataSharing,
                    (value) => setState(() => _dataSharing = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Permissions Section
              _buildSection(
                'App Permissions',
                Icons.security,
                [
                  _buildToggleTile(
                    'Location Services',
                    'Access your location for location-based features',
                    _locationServices,
                    (value) => setState(() => _locationServices = value),
                  ),
                  _buildToggleTile(
                    'Camera Access',
                    'Use camera for photo analysis features',
                    _cameraPermission,
                    (value) => setState(() => _cameraPermission = value),
                  ),
                  _buildToggleTile(
                    'Microphone Access',
                    'Use microphone for voice input features',
                    _microphonePermission,
                    (value) => setState(() => _microphonePermission = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Security Section
              _buildSection(
                'Security',
                Icons.lock,
                [
                  _buildToggleTile(
                    'Two-Factor Authentication',
                    'Add an extra layer of security to your account',
                    _twoFactorAuth,
                    (value) => setState(() => _twoFactorAuth = value),
                  ),
                  _buildDropdownTile(
                    'Data Retention',
                    'How long to keep your data before automatic deletion',
                    _dataRetention,
                    ['7_days', '30_days', '90_days', '1_year', 'forever'],
                    {
                      '7_days': '7 days',
                      '30_days': '30 days (Default)',
                      '90_days': '90 days',
                      '1_year': '1 year',
                      'forever': 'Keep forever',
                    },
                    (value) => setState(() => _dataRetention = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Data Management Section
              _buildSection(
                'Data Management',
                Icons.storage,
                [
                  _buildActionTile(
                    'Download My Data',
                    'Get a copy of all your personal data',
                    Icons.download,
                    () => _downloadData(context),
                  ),
                  _buildActionTile(
                    'Delete My Data',
                    'Permanently remove all your personal data',
                    Icons.delete_forever,
                    () => _deleteData(context),
                    isDestructive: true,
                  ),
                  _buildActionTile(
                    'Data Processing Info',
                    'Learn how your data is processed',
                    Icons.info,
                    () => _showDataProcessingInfo(context),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Legal Section
              _buildSection(
                'Legal & Policies',
                Icons.description,
                [
                  _buildActionTile(
                    'Privacy Policy',
                    'Read our complete privacy policy',
                    Icons.privacy_tip,
                    () => _openPrivacyPolicy(context),
                  ),
                  _buildActionTile(
                    'Terms of Service',
                    'Read our terms of service',
                    Icons.description,
                    () => _openTermsOfService(context),
                  ),
                  _buildActionTile(
                    'Cookie Policy',
                    'Learn about our use of cookies',
                    Icons.cookie,
                    () => _openCookiePolicy(context),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingXXL),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _savePrivacySettings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WFColors.purple400,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                    ),
                  ),
                  child: Text(
                    'Save Privacy Settings',
                    style: WFTextStyles.button.copyWith(color: Colors.white),
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

  Widget _buildToggleTile(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Row(
      children: [
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
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: WFColors.purple400,
          inactiveThumbColor: WFColors.gray500,
          inactiveTrackColor: WFColors.gray700,
        ),
      ],
    );
  }

  Widget _buildDropdownTile(
    String title,
    String subtitle,
    String value,
    List<String> options,
    Map<String, String> displayNames,
    ValueChanged<String> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: WFTextStyles.labelLarge),
        const SizedBox(height: 2),
        Text(subtitle, style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
        const SizedBox(height: WFDims.spacingS),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: WFDims.paddingM),
          decoration: BoxDecoration(
            color: WFColors.gray800.withOpacity(0.5),
            borderRadius: BorderRadius.circular(WFDims.radiusSmall),
            border: Border.all(color: WFColors.glassBorder),
          ),
          child: DropdownButton<String>(
            value: value,
            onChanged: (newValue) => newValue != null ? onChanged(newValue) : null,
            dropdownColor: WFColors.gray800,
            underline: const SizedBox(),
            isExpanded: true,
            style: WFTextStyles.bodyMedium,
            items: options.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  displayNames[option] ?? option.toUpperCase(),
                  style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textPrimary),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
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
            Icon(
              icon,
              color: isDestructive ? Colors.red : WFColors.purple400,
              size: 20,
            ),
            const SizedBox(width: WFDims.spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: WFTextStyles.labelLarge.copyWith(
                      color: isDestructive ? Colors.red : null,
                    ),
                  ),
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

  void _downloadData(BuildContext context) {
    // TODO: Implement data download
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data download coming soon')),
    );
  }

  void _deleteData(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('Delete All Data', style: WFTextStyles.h3.copyWith(color: Colors.red)),
        content: Text(
          'This will permanently delete all your personal data, progress, and account information. This action cannot be undone.',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: WFTextStyles.button.copyWith(color: WFColors.gray400)),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement data deletion
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data deletion coming soon')),
              );
            },
            child: Text('Delete All Data', style: WFTextStyles.button.copyWith(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showDataProcessingInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('Data Processing Information', style: WFTextStyles.h3),
        content: Text(
          'Your data is processed securely and used only to provide and improve the Beguile AI service. We never sell your personal information.',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close', style: WFTextStyles.button.copyWith(color: WFColors.purple400)),
          ),
        ],
      ),
    );
  }

  void _openPrivacyPolicy(BuildContext context) {
    // TODO: Open privacy policy
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Privacy policy coming soon')),
    );
  }

  void _openTermsOfService(BuildContext context) {
    // TODO: Open terms of service
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Terms of service coming soon')),
    );
  }

  void _openCookiePolicy(BuildContext context) {
    // TODO: Open cookie policy
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cookie policy coming soon')),
    );
  }

  void _savePrivacySettings() {
    // TODO: Implement saving privacy settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Privacy settings saved'),
        backgroundColor: Colors.green,
      ),
    );
  }
} 