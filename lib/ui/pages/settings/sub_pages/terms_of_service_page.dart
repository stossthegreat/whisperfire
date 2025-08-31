import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/theme.dart';

class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({super.key});

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  String _termsContent = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTermsOfService();
  }

  Future<void> _loadTermsOfService() async {
    try {
      // Try to load from assets first
      final content = await rootBundle.loadString('assets/legal/terms.md');
      setState(() {
        _termsContent = content;
        _isLoading = false;
      });
    } catch (e) {
      // Fallback to default content
      setState(() {
        _termsContent = _getDefaultTermsOfService();
        _isLoading = false;
      });
    }
  }

  String _getDefaultTermsOfService() {
    return '''# Terms of Service

## Last Updated: ${DateTime.now().year}

### 1. Acceptance of Terms

By downloading, installing, or using **Beguile AI**, you agree to be bound by these Terms of Service. If you do not agree to these terms, please do not use the app.

### 2. Description of Service

Beguile AI is an educational application that provides:
- Interactive learning lessons and content
- AI-powered mentorship and guidance
- Progress tracking and achievement systems
- Educational resources and materials

### 3. User Accounts

- You are responsible for maintaining the security of your account
- You must provide accurate and complete information
- You are responsible for all activities under your account
- You must be at least 18 years old to use this service

### 4. Acceptable Use

**You agree to use the app only for lawful purposes and in accordance with these terms.**

**Prohibited activities include:**
- Violating any applicable laws or regulations
- Harassing, abusing, or harming others
- Attempting to gain unauthorized access to the app
- Using the app for commercial purposes without permission
- Sharing inappropriate or harmful content

### 5. Intellectual Property

- The app and its content are owned by Beguile AI
- You retain ownership of your user-generated content
- You grant us a license to use your content for app improvement
- You may not copy, modify, or distribute our content without permission

### 6. Privacy and Data

- Your privacy is important to us
- We collect and use data as described in our Privacy Policy
- By using the app, you consent to our data practices
- You can delete your account and data at any time

### 7. Disclaimers

**The app is provided "as is" without warranties of any kind.**

- We do not guarantee the app will be error-free or uninterrupted
- We are not responsible for any damages or losses
- Educational content is for informational purposes only
- We do not guarantee specific learning outcomes

### 8. Limitation of Liability

**Beguile AI shall not be liable for any indirect, incidental, special, or consequential damages.**

Our total liability shall not exceed the amount you paid for the app, if any.

### 9. Termination

- You may terminate your account at any time
- We may terminate or suspend your account for violations
- Upon termination, your right to use the app ceases
- We may delete your account and data upon termination

### 10. Changes to Terms

- We may modify these terms at any time
- We will notify you of significant changes
- Continued use constitutes acceptance of new terms
- If you disagree with changes, stop using the app

### 11. Governing Law

These terms are governed by the laws of the jurisdiction where Beguile AI operates.

### 12. Contact Information

For questions about these terms, contact us at:
- Email: legal@beguile.ai
- App: Use the Contact option in App Information

### 13. Severability

If any provision of these terms is found to be unenforceable, the remaining provisions remain in effect.

---

**By using Beguile AI, you acknowledge that you have read, understood, and agree to these Terms of Service.**''';
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
        title: Text('Terms of Service', style: WFTextStyles.h3),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: WFColors.purple400),
            onPressed: _shareTermsOfService,
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
                            Icons.description,
                            size: 48,
                            color: WFColors.purple400,
                          ),
                          const SizedBox(height: WFDims.spacingL),
                          Text(
                            'Terms of Service',
                            style: WFTextStyles.h2.copyWith(
                              color: WFColors.purple400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: WFDims.spacingS),
                          Text(
                            'Our terms and conditions',
                            style: WFTextStyles.bodyMedium.copyWith(
                              color: WFColors.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: WFDims.spacingXXL),

                    // Terms of Service Content
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
                        _termsContent,
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

  void _shareTermsOfService() async {
    const text = 'Beguile AI Terms of Service - Read our terms at beguile.ai';
    await Clipboard.setData(const ClipboardData(text: text));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Terms of service link copied to clipboard'),
          backgroundColor: WFColors.purple400,
        ),
      );
    }
  }
}
