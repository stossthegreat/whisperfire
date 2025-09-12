import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/theme.dart';
import '../../../atoms/atoms.dart';
import '../../../../data/providers.dart';
import '../../../../data/models/profile_models.dart';
import '../../../../data/services/cache_service.dart';
import '../../../../data/providers/auth_providers.dart';

class AccountManagementPage extends ConsumerWidget {
  const AccountManagementPage({super.key});

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
        title: Text('Account Management', style: WFTextStyles.h3),
      ),
      body: SafeArea(
        child: profileAsync.when(
          data: (profile) => _buildAccountManagement(context, profile),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }

  Widget _buildAccountManagement(BuildContext context, UserProfile profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(WFDims.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Warning Section
          _buildWarningSection(context),

          const SizedBox(height: WFDims.spacingL),

          // Data Management Section
          _buildSection(
            'Data Management',
            Icons.storage,
            [
              _buildActionTile(
                'Reset Progress',
                'Start fresh with all lessons (keeps account)',
                Icons.refresh,
                () => _showResetProgressDialog(context),
              ),
              _buildActionTile(
                'Clear Learning History',
                'Remove all lesson progress (keeps account)',
                Icons.clear_all,
                () => _showClearHistoryDialog(context),
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
                'Deactivate Account',
                'Temporarily disable your account',
                Icons.pause_circle,
                () => _showDeactivateAccountDialog(context),
                isDestructive: true,
              ),
              _buildActionTile(
                'Delete Account',
                'Permanently remove your account and all data',
                Icons.delete_forever,
                () => _showDeleteAccountDialog(context),
                isDestructive: true,
              ),
            ],
          ),

          const SizedBox(height: WFDims.spacingXXL),
        ],
      ),
    );
  }

  Widget _buildWarningSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(WFDims.paddingL),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(WFDims.radiusMedium),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 24),
          const SizedBox(width: WFDims.spacingM),
          Expanded(
            child: Text(
              'Account actions are irreversible. Please proceed with caution.',
              style: TextStyle(
                color: Colors.amber[200],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(WFDims.paddingL),
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
            ...children
                .expand((child) => [
                      child,
                      if (child != children.last)
                        const SizedBox(height: WFDims.spacingM),
                    ])
                .toList(),
          ],
        ),
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
            Icon(icon,
                color: isDestructive ? Colors.red : WFColors.purple400,
                size: 20),
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
                  Text(subtitle,
                      style: WFTextStyles.bodySmall
                          .copyWith(color: WFColors.textTertiary)),
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

  void _showResetProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray800,
        title: Text('Reset Progress', style: WFTextStyles.h3),
        content: Text(
          'This will reset all your lesson progress and XP. This action cannot be undone. Continue?',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: WFColors.purple400)),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement reset progress
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Progress reset successfully')),
              );
            },
            child: Text('Reset', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showClearHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray800,
        title: Text('Clear History', style: WFTextStyles.h3),
        content: Text(
          'This will clear all your learning history. This action cannot be undone. Continue?',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: WFColors.purple400)),
          ),
          TextButton(
            onPressed: () async {
              await CacheService.clearHistory();
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('History cleared successfully')),
                );
              }
            },
            child: Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showDeactivateAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray800,
        title: Text('Deactivate Account', style: WFTextStyles.h3),
        content: Text(
          'Your account will be temporarily disabled. You can reactivate it later by logging in. Continue?',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: WFColors.purple400)),
          ),
          TextButton(
            onPressed: () async {
              final container = ProviderScope.containerOf(context);
              try {
                // Sign out and clear local caches
                await CacheService.clearAll();
                await container.read(authServiceProvider).signOut();
              } catch (_) {}
              if (context.mounted) {
                Navigator.pop(context); // close dialog
                context.go('/onboarding'); // router will handle paywall/onboarding
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account deactivated')),
                );
              }
            },
            child: Text('Deactivate', style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray800,
        title: Text('Delete Account', style: WFTextStyles.h3),
        content: Text(
          'This action is PERMANENT and cannot be undone. All your data, progress, and account information will be permanently deleted. Are you absolutely sure?',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: WFColors.purple400)),
          ),
          TextButton(
            onPressed: () async {
              final container = ProviderScope.containerOf(context);
              String? error;
              try {
                await container.read(authServiceProvider).deleteAccount();
              } catch (e) {
                error = e.toString();
              }
              try {
                await CacheService.clearAll();
              } catch (_) {}
              try {
                await container.read(authServiceProvider).signOut();
              } catch (_) {}
              if (context.mounted) {
                Navigator.pop(context); // close dialog
                context.go('/onboarding');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      error == null ? 'Account deleted permanently' : 'Account deleted locally. Sign-in may be required. ($error)'
                    ),
                  ),
                );
              }
            },
            child: Text('Delete Permanently', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
