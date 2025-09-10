import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/app_header.dart';
import '../../../data/services/paywall_service.dart';

final entitlementProvider = FutureProvider<bool>((ref) async {
  return PaywallService.isEntitled();
});

class PaywallPage extends ConsumerStatefulWidget {
  const PaywallPage({super.key});

  @override
  ConsumerState<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends ConsumerState<PaywallPage> {
  String _selectedPlan = 'monthly';
  bool _isProcessing = false;
  final TextEditingController _inviteController = TextEditingController();

  @override
  void dispose() {
    _inviteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entitledAsync = ref.watch(entitlementProvider);

    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: const AppHeader(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                children: [
                  _hero(),
                  const SizedBox(height: WFDims.spacingXL),
                  _plans(),
                  const SizedBox(height: WFDims.spacingL),
                  _benefits(),
                  const SizedBox(height: WFDims.spacingL),
                  _inviteUnlock(),
                  const SizedBox(height: WFDims.spacingXL),
                  _cta(entitledAsync),
                  const SizedBox(height: WFDims.spacingXXL),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _hero() {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            gradient: WFGradients.purpleGradient,
            borderRadius: BorderRadius.circular(28),
            boxShadow: WFShadows.purpleGlow,
          ),
          child: const Icon(Icons.auto_awesome, color: Colors.white, size: 48),
        ),
        const SizedBox(height: WFDims.spacingL),
        Text('Unlock Whisperfire Pro', style: WFTextStyles.h1),
        const SizedBox(height: WFDims.spacingS),
        Text(
          'Master persuasion. See patterns. Build unshakeable presence.',
          style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _plans() {
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 560;

    final monthly = Expanded(child: _planCard('monthly', '\$9.99/mo', 'Cancel anytime'));
    final yearly = Expanded(child: _planCard('yearly', '\$90/year', '2 months free'));

    if (isNarrow) {
      return Column(
        children: [
          monthly,
          const SizedBox(height: WFDims.spacingM),
          yearly,
        ],
      );
    }

    return Row(
      children: [
        monthly,
        const SizedBox(width: WFDims.spacingM),
        yearly,
      ],
    );
  }

  Widget _planCard(String id, String price, String tag) {
    final bool selected = _selectedPlan == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedPlan = id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(WFDims.paddingM),
        decoration: BoxDecoration(
          color: selected ? WFColors.purple500.withOpacity(0.2) : WFColors.gray800.withOpacity(0.3),
          borderRadius: BorderRadius.circular(WFDims.radiusLarge),
          border: Border.all(color: selected ? WFColors.purple400 : WFColors.glassBorder, width: selected ? 2 : 1),
          boxShadow: selected ? WFShadows.purpleGlow : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off, color: WFColors.purple300),
                const SizedBox(width: 8),
                Text(id == 'monthly' ? 'Monthly' : 'Yearly', style: WFTextStyles.h4),
              ],
            ),
            const SizedBox(height: WFDims.spacingS),
            Text(price, style: WFTextStyles.h2.copyWith(color: Colors.white)),
            const SizedBox(height: 4),
            Text(tag, style: WFTextStyles.labelMedium.copyWith(color: WFColors.textTertiary)),
          ],
        ),
      ),
    );
  }

  Widget _benefits() {
    final benefits = [
      ['Pattern analysis', 'See manipulation in plain sight'],
      ['Mentor guidance', 'Legendary AI mentors on demand'],
      ['Lessons & worlds', 'Structured progression and XP'],
      ['OCR scan', 'Capture, extract, and evaluate text fast'],
      ['Offline-ready', 'Core content cached for focus'],
    ];

    return Container(
      decoration: BoxDecoration(
        color: WFColors.gray800.withOpacity(0.35),
        borderRadius: BorderRadius.circular(WFDims.radiusLarge),
        border: Border.all(color: WFColors.glassBorder),
      ),
      padding: const EdgeInsets.all(WFDims.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Everything you unlock', style: WFTextStyles.h3),
          const SizedBox(height: WFDims.spacingM),
          ...benefits.map((b) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
                    const SizedBox(width: 10),
                    Expanded(child: Text(b[0], style: WFTextStyles.bodyMedium)),
                    const SizedBox(width: 8),
                    Text(b[1], style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _inviteUnlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Have an invite code?', style: WFTextStyles.h4),
        const SizedBox(height: WFDims.spacingS),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _inviteController,
                decoration: InputDecoration(
                  hintText: 'Enter code to unlock free access',
                  hintStyle: WFTextStyles.bodyMedium.copyWith(color: WFColors.textMuted),
                  filled: true,
                  fillColor: WFColors.gray800.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                    borderSide: BorderSide(color: WFColors.glassBorder),
                  ),
                ),
              ),
            ),
            const SizedBox(width: WFDims.spacingS),
            ElevatedButton(
              onPressed: _isProcessing ? null : _onRedeem,
              child: _isProcessing ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Redeem'),
            )
          ],
        ),
      ],
    );
  }

  Widget _cta(AsyncValue<bool> entitledAsync) {
    final entitled = entitledAsync.value ?? false;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: (_isProcessing || (!entitled && !PaywallService.bypassPaywall)) ? null : () => context.go('/login'),
        icon: const Icon(Icons.lock_open),
        label: Text(entitled || PaywallService.bypassPaywall ? 'Continue' : 'Subscribe to Continue'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Future<void> _onRedeem() async {
    setState(() => _isProcessing = true);
    final code = _inviteController.text;
    final ok = await PaywallService.redeemInvite(code);
    setState(() => _isProcessing = false);
    if (!mounted) return;
    if (ok) {
      ref.refresh(entitlementProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invite accepted. Access unlocked.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid code.')),
      );
    }
  }
} 