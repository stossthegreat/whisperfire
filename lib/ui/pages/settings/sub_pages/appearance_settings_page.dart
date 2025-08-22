import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../../atoms/atoms.dart';

class AppearanceSettingsPage extends ConsumerStatefulWidget {
  const AppearanceSettingsPage({super.key});

  @override
  ConsumerState<AppearanceSettingsPage> createState() => _AppearanceSettingsPageState();
}

class _AppearanceSettingsPageState extends ConsumerState<AppearanceSettingsPage> {
  String _selectedTheme = 'dark';
  String _selectedColorScheme = 'purple';
  String _selectedFontSize = 'medium';
  bool _animationsEnabled = true;
  bool _hapticFeedback = true;

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
        title: Text('Appearance', style: WFTextStyles.h3),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Theme Section
              _buildSection(
                'Theme & Colors',
                Icons.palette,
                [
                  _buildDropdownTile(
                    'App Theme',
                    'Choose your preferred theme',
                    _selectedTheme,
                    ['light', 'dark', 'auto'],
                    {'light': 'Light', 'dark': 'Dark', 'auto': 'Auto (System)'},
                    (value) => setState(() => _selectedTheme = value),
                  ),
                  _buildDropdownTile(
                    'Color Scheme',
                    'Select your preferred color palette',
                    _selectedColorScheme,
                    ['purple', 'blue', 'green', 'red', 'orange'],
                    {
                      'purple': 'Purple (Default)',
                      'blue': 'Blue',
                      'green': 'Green',
                      'red': 'Red',
                      'orange': 'Orange',
                    },
                    (value) => setState(() => _selectedColorScheme = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Typography Section
              _buildSection(
                'Typography',
                Icons.text_fields,
                [
                  _buildDropdownTile(
                    'Font Size',
                    'Adjust text size for better readability',
                    _selectedFontSize,
                    ['small', 'medium', 'large', 'extra_large'],
                    {
                      'small': 'Small',
                      'medium': 'Medium (Default)',
                      'large': 'Large',
                      'extra_large': 'Extra Large',
                    },
                    (value) => setState(() => _selectedFontSize = value),
                  ),
                  _buildToggleTile(
                    'Bold Headers',
                    'Make section headers more prominent',
                    true,
                    (value) {},
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Animations Section
              _buildSection(
                'Animations & Effects',
                Icons.animation,
                [
                  _buildToggleTile(
                    'Enable Animations',
                    'Smooth transitions and progress animations',
                    _animationsEnabled,
                    (value) => setState(() => _animationsEnabled = value),
                  ),
                  _buildToggleTile(
                    'Progress Animations',
                    'Animated progress bars and level ups',
                    true,
                    (value) {},
                  ),
                  _buildToggleTile(
                    'Haptic Feedback',
                    'Vibration feedback on interactions',
                    _hapticFeedback,
                    (value) => setState(() => _hapticFeedback = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Preview Section
              _buildSection(
                'Preview',
                Icons.visibility,
                [
                  _buildPreviewCard(),
                ],
              ),

              const SizedBox(height: WFDims.spacingXXL),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveAppearanceSettings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WFColors.purple400,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                    ),
                  ),
                  child: Text(
                    'Save Changes',
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

  Widget _buildPreviewCard() {
    return Container(
      padding: const EdgeInsets.all(WFDims.paddingM),
      decoration: BoxDecoration(
        color: WFColors.gray800.withOpacity(0.3),
        borderRadius: BorderRadius.circular(WFDims.radiusMedium),
        border: Border.all(color: WFColors.glassBorder.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sample Card', style: WFTextStyles.h4),
          const SizedBox(height: WFDims.spacingS),
          Text(
            'This is how your content will look with the selected appearance settings.',
            style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textSecondary),
          ),
          const SizedBox(height: WFDims.spacingM),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: WFColors.purple400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Sample Button',
              style: WFTextStyles.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _saveAppearanceSettings() {
    // TODO: Implement saving appearance settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Appearance settings saved'),
        backgroundColor: Colors.green,
      ),
    );
  }
} 