import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../core/theme/theme.dart';
import '../../../atoms/atoms.dart';

class AppInfoPage extends StatefulWidget {
  const AppInfoPage({super.key});

  @override
  State<AppInfoPage> createState() => _AppInfoPageState();
}

class _AppInfoPageState extends State<AppInfoPage> {
  PackageInfo? _packageInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _packageInfo = packageInfo;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
        title: Text('App Information', style: WFTextStyles.h3),
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(WFDims.paddingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: WFGradients.purpleGradient,
                              borderRadius:
                                  BorderRadius.circular(WFDims.radiusXLarge),
                              boxShadow: WFShadows.purpleGlow,
                            ),
                            child: Icon(
                              Icons.auto_awesome,
                              size: 50,
                              color: WFColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: WFDims.spacingL),
                          Text(
                            'Beguile AI',
                            style: WFTextStyles.h1.copyWith(
                              color: WFColors.purple400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: WFDims.spacingS),
                          Text(
                            'Where desire becomes strategy',
                            style: WFTextStyles.bodyMedium.copyWith(
                              color: WFColors.textTertiary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: WFDims.spacingXXL),

                    // App Version Section
                    _buildInfoSection(
                      'App Information',
                      Icons.info,
                      [
                        if (_packageInfo != null) ...[
                          _buildInfoTile('Version', _packageInfo!.version,
                              Icons.system_update),
                          const SizedBox(height: WFDims.spacingM),
                          _buildInfoTile('Build Number',
                              _packageInfo!.buildNumber, Icons.build),
                          const SizedBox(height: WFDims.spacingM),
                        ],
                        _buildInfoTile('App Name', 'Beguile AI', Icons.apps),
                        const SizedBox(height: WFDims.spacingM),
                        _buildInfoTile(
                            'Package',
                            _packageInfo?.packageName ?? 'com.beguile.ai',
                            Icons.inventory),
                      ],
                    ),

                    const SizedBox(height: WFDims.spacingL),

                    // About Section
                    _buildInfoSection(
                      'About',
                      Icons.auto_awesome,
                      [
                        _buildInfoTile(
                            'Description',
                            'AI-powered learning platform for mastering influence and psychology',
                            Icons.description),
                        const SizedBox(height: WFDims.spacingM),
                        _buildInfoTile(
                            'Category', 'Education & Learning', Icons.category),
                        const SizedBox(height: WFDims.spacingM),
                        _buildInfoTile('Developer', 'Beguile AI Team',
                            Icons.developer_mode),
                      ],
                    ),

                    const SizedBox(height: WFDims.spacingL),

                    // Contact Section
                    _buildInfoSection(
                      'Contact & Support',
                      Icons.contact_support,
                      [
                        _buildActionTile(
                          'Email Support',
                          'Get help and support via email',
                          Icons.email,
                          () => _sendEmail(),
                        ),
                        const SizedBox(height: WFDims.spacingM),
                        _buildActionTile(
                          'Website',
                          'Visit our official website',
                          Icons.language,
                          () => _openWebsite(),
                        ),
                        const SizedBox(height: WFDims.spacingM),
                        _buildActionTile(
                          'Copy App Info',
                          'Copy app information to clipboard',
                          Icons.copy,
                          () => _copyAppInfo(),
                        ),
                      ],
                    ),

                    const SizedBox(height: WFDims.spacingXXL),

                    // Footer
                    Center(
                      child: Text(
                        '© ${DateTime.now().year} Beguile AI. All rights reserved.',
                        style: WFTextStyles.bodySmall.copyWith(
                          color: WFColors.textTertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: WFDims.spacingXXL),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildInfoSection(String title, IconData icon, List<Widget> children) {
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
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon) {
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
                Text(
                  value,
                  style: WFTextStyles.bodyMedium
                      .copyWith(color: WFColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
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
                  Text(
                    subtitle,
                    style: WFTextStyles.bodySmall
                        .copyWith(color: WFColors.textTertiary),
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

  void _sendEmail() async {
    const email = 'support@beguile.ai';
    const subject = 'Beguile AI Support Request';
    const body = 'Hello Beguile AI team,\n\nI need help with:';

    final url = 'mailto:$email?subject=$subject&body=$body';

    try {
      // TODO: Implement email opening
      await Clipboard.setData(const ClipboardData(text: email));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Support email copied to clipboard: support@beguile.ai'),
            backgroundColor: WFColors.purple400,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open email app'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _openWebsite() async {
    const website = 'https://beguile.ai';
    await Clipboard.setData(const ClipboardData(text: website));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Website URL copied to clipboard: beguile.ai'),
          backgroundColor: WFColors.purple400,
        ),
      );
    }
  }

  void _copyAppInfo() async {
    final info = '''
Beguile AI
Version: ${_packageInfo?.version ?? 'Unknown'}
Build: ${_packageInfo?.buildNumber ?? 'Unknown'}
Package: ${_packageInfo?.packageName ?? 'com.beguile.ai'}

Website: beguile.ai
Support: support@beguile.ai
''';

    await Clipboard.setData(ClipboardData(text: info));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('App information copied to clipboard'),
          backgroundColor: WFColors.purple400,
        ),
      );
    }
  }
}
