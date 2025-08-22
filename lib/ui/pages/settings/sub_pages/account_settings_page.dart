import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../../../widgets/app_header.dart';
import '../../../atoms/atoms.dart';
import '../../../../data/providers.dart';
import '../../../../data/models/profile_models.dart';
import '../../../../content/lessons_catalog.dart';
import '../../../../features/lessons/lesson_player/lesson_player_page.dart';

class AccountSettingsPage extends ConsumerWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: WFColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Account Settings', style: WFTextStyles.h3),
      ),
      body: SafeArea(
        child: profileAsync.when(
          data: (profile) => _buildAccountSettings(context, profile),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context, UserProfile profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(WFDims.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          _buildSection(
            'Profile Information',
            Icons.person,
            [
              _buildProfileTile(
                'Display Name',
                profile.id,
                Icons.edit,
                () => _editDisplayName(context),
              ),
              _buildProfileTile(
                'Total XP',
                '${profile.xpTotal}',
                Icons.star,
                null,
              ),
              _buildProfileTile(
                'Account Level',
                'Level ${_calculateAccountLevel(profile.xpTotal)}',
                Icons.trending_up,
                null,
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
                'Export My Data',
                'Download all your progress and achievements',
                Icons.download,
                () => _exportData(context),
              ),
              _buildActionTile(
                'Clear Learning History',
                'Remove all lesson progress (keeps account)',
                Icons.clear_all,
                () => _clearHistory(context),
              ),
              _buildActionTile(
                'Reset Progress',
                'Start fresh with all lessons (keeps account)',
                Icons.refresh,
                () => _resetProgress(context),
              ),
            ],
          ),

          const SizedBox(height: WFDims.spacingL),

          // Account Actions Section
          _buildSection(
            'Account Actions',
            Icons.account_circle,
            [
              _buildActionTile(
                'Change Password',
                'Update your account password',
                Icons.lock,
                () => _changePassword(context),
              ),
              _buildActionTile(
                'Delete Account',
                'Permanently remove your account and all data',
                Icons.delete_forever,
                () => _deleteAccount(context),
                isDestructive: true,
              ),
            ],
          ),

          const SizedBox(height: WFDims.spacingXXL),
        ],
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

  Widget _buildProfileTile(String title, String value, IconData icon, VoidCallback? onTap) {
    return Container(
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
                Text(value, style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textSecondary)),
              ],
            ),
          ),
          if (onTap != null)
            IconButton(
              icon: Icon(Icons.edit, color: WFColors.purple400, size: 20),
              onPressed: onTap,
            ),
        ],
      ),
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

  int _calculateAccountLevel(int xp) {
    if (xp < 100) return 1;
    if (xp < 250) return 2;
    if (xp < 500) return 3;
    if (xp < 1000) return 4;
    if (xp < 2000) return 5;
    return 6;
  }

  void _editDisplayName(BuildContext context) {
    // TODO: Implement display name editing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Display name editing coming soon')),
    );
  }

  void _exportData(BuildContext context) {
    // TODO: Implement data export
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data export coming soon')),
    );
  }

  void _clearHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('Clear Learning History', style: WFTextStyles.h3),
        content: Text(
          'This will remove all your lesson progress but keep your account. You can start lessons again from the beginning.',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: WFTextStyles.button.copyWith(color: WFColors.gray400)),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement clear history
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('History cleared')),
              );
            },
            child: Text('Clear History', style: WFTextStyles.button.copyWith(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  void _resetProgress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('Reset Progress', style: WFTextStyles.h3),
        content: Text(
          'This will reset all your lesson progress and XP. You can start fresh with all lessons.',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: WFTextStyles.button.copyWith(color: WFColors.gray400)),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement reset progress
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Progress reset')),
              );
            },
            child: Text('Reset Progress', style: WFTextStyles.button.copyWith(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  void _changePassword(BuildContext context) {
    // TODO: Implement password change
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password change coming soon')),
    );
  }

  void _deleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('Delete Account', style: WFTextStyles.h3.copyWith(color: Colors.red)),
        content: Text(
          'This action cannot be undone. All your data, progress, and achievements will be permanently deleted.',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: WFTextStyles.button.copyWith(color: WFColors.gray400)),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement account deletion
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account deletion coming soon')),
              );
            },
            child: Text('Delete Account', style: WFTextStyles.button.copyWith(color: Colors.red)),
          ),
        ],
      ),
    );
  }
} 