import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/theme.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String _privacyContent = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPrivacyPolicy();
  }

  Future<void> _loadPrivacyPolicy() async {
    try {
      // Try to load from assets first
      final content = await rootBundle.loadString('assets/legal/privacy.md');
      setState(() {
        _privacyContent = content;
        _isLoading = false;
      });
    } catch (e) {
      // Fallback to default content
      setState(() {
        _privacyContent = _getDefaultPrivacyPolicy();
        _isLoading = false;
      });
    }
  }

  String _getDefaultPrivacyPolicy() {
    return '''# Privacy Policy

## Last Updated: ${DateTime.now().year}

### 1. Information We Collect

**Beguile AI** collects minimal personal information to provide you with the best learning experience:

- **Account Information**: Display name, progress data, XP points
- **Usage Data**: Lesson progress, learning patterns, app interactions
- **Device Information**: Basic device info for app functionality

### 2. How We Use Your Information

We use your information to:
- Provide personalized learning experiences
- Track your progress and achievements
- Improve our app and services
- Ensure app security and functionality

### 3. Data Storage and Security

- All data is stored locally on your device
- No personal information is transmitted to external servers
- We use industry-standard security measures
- Your data remains private and under your control

### 4. Data Sharing

**We do not share your personal information with third parties.**
- No data is sold, rented, or shared
- No advertising companies receive your information
- No analytics services collect personal data

### 5. Your Rights

You have the right to:
- Access your personal data
- Delete your account and all data
- Export your learning progress
- Control your privacy settings

### 6. Data Retention

- Data is retained only while you use the app
- Account deletion removes all data permanently
- No data is stored after account deletion

### 7. Children's Privacy

This app is not intended for children under 13. We do not knowingly collect personal information from children under 13.

### 8. Changes to This Policy

We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy in the app.

### 9. Contact Us

If you have questions about this privacy policy, please contact us at:
- Email: privacy@beguile.ai
- App: Use the Contact option in App Information

### 10. Your Consent

By using Beguile AI, you consent to this privacy policy and our data practices as described herein.

---

**Your privacy is important to us. We're committed to protecting your personal information and providing transparency about how we handle your data.**''';
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
        title: Text('Privacy Policy', style: WFTextStyles.h3),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: WFColors.purple400),
            onPressed: _sharePrivacyPolicy,
          ),
        ],
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
                          Icon(
                            Icons.privacy_tip,
                            size: 48,
                            color: WFColors.purple400,
                          ),
                          const SizedBox(height: WFDims.spacingL),
                          Text(
                            'Privacy Policy',
                            style: WFTextStyles.h2.copyWith(
                              color: WFColors.purple400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: WFDims.spacingS),
                          Text(
                            'How we protect your privacy',
                            style: WFTextStyles.bodyMedium.copyWith(
                              color: WFColors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: WFDims.spacingXXL),

                    // Privacy Policy Content
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(WFDims.paddingL),
                      decoration: BoxDecoration(
                        color: WFColors.gray800.withOpacity(0.3),
                        borderRadius:
                            BorderRadius.circular(WFDims.radiusMedium),
                        border: Border.all(
                            color: WFColors.glassBorder.withOpacity(0.3)),
                      ),
                      child: Text(
                        _privacyContent,
                        style: WFTextStyles.bodyMedium.copyWith(
                          color: WFColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ),

                    const SizedBox(height: WFDims.spacingXXL),
                  ],
                ),
              ),
      ),
    );
  }

  void _sharePrivacyPolicy() async {
    const text =
        'Beguile AI Privacy Policy - Read how we protect your privacy at beguile.ai';
    await Clipboard.setData(const ClipboardData(text: text));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Privacy policy link copied to clipboard'),
          backgroundColor: WFColors.purple400,
        ),
      );
    }
  }
}
