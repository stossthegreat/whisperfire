import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';
import '../../../data/models/settings_models.dart';
import '../../../data/services/cache_service.dart';
import '../../atoms/atoms.dart';

// ===== PROVIDERS =====
final appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>((ref) {
  return AppSettingsNotifier();
});

// ===== STATE NOTIFIERS =====
class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier() : super(CacheService.getSettings());

  void updateTone(String tone) {
    state = state.copyWith(defaultTone: tone);
    _saveSettings();
  }

  void updateAnalyzeMode(String mode) {
    state = state.copyWith(defaultAnalyzeMode: mode);
    _saveSettings();
  }

  void updateStreaming(bool streaming) {
    state = state.copyWith(streaming: streaming);
    _saveSettings();
  }

  void updateSaveHistory(bool saveHistory) {
    state = state.copyWith(saveHistory: saveHistory);
    _saveSettings();
  }

  void updateSafeMode(bool safeMode) {
    state = state.copyWith(safeMode: safeMode);
    _saveSettings();
  }

  void updateOcrLang(String ocrLang) {
    state = state.copyWith(ocrLang: ocrLang);
    _saveSettings();
  }

  void _saveSettings() {
    CacheService.saveSettings(state);
  }

  void resetToDefaults() {
    state = AppSettings.defaults();
    _saveSettings();
  }
}

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(appSettingsProvider);
    
    return Scaffold(
      backgroundColor: WFColors.base,
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
                      'Configure your defense system',
                      style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingXXL),
              
              // Analysis Defaults
              _settingsSection(
                'Analysis Defaults',
                [
                  _settingDropdown(
                    'Default Tone',
                    'Controls the intensity of analysis responses',
                    settings.defaultTone,
                    ['brutal', 'soft', 'clinical'],
                    _getToneDisplayNames(),
                    (value) => ref.read(appSettingsProvider.notifier).updateTone(value),
                  ),
                  _settingDropdown(
                    'Default Mode',
                    'Choose between quick scan or deep pattern analysis',
                    settings.defaultAnalyzeMode,
                    ['scan', 'pattern'],
                    {'scan': 'Scan', 'pattern': 'Pattern'},
                    (value) => ref.read(appSettingsProvider.notifier).updateAnalyzeMode(value),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Behavior Settings
              _settingsSection(
                'Behavior',
                [
                  _settingToggle(
                    'Streaming',
                    'Stream mentor responses in real-time',
                    settings.streaming,
                    (value) => ref.read(appSettingsProvider.notifier).updateStreaming(value),
                  ),
                  _settingToggle(
                    'Save History',
                    'Keep local history of your sessions',
                    settings.saveHistory,
                    (value) => ref.read(appSettingsProvider.notifier).updateSaveHistory(value),
                  ),
                  _settingToggle(
                    'Safe Mode',
                    'Soften harsh language in responses',
                    settings.safeMode,
                    (value) => ref.read(appSettingsProvider.notifier).updateSafeMode(value),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Advanced Settings
              _settingsSection(
                'Advanced',
                [
                  _settingDropdown(
                    'OCR Language',
                    'Language for optical character recognition',
                    settings.ocrLang,
                    ['eng', 'spa', 'fra', 'deu', 'ita', 'por'],
                    _getLanguageDisplayNames(),
                    (value) => ref.read(appSettingsProvider.notifier).updateOcrLang(value),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Data Management
              _settingsSection(
                'Data Management',
                [
                  _settingAction(
                    'Clear History',
                    'Remove all saved analysis and mentor sessions',
                    Icons.delete_outline,
                    () => _showClearHistoryDialog(context),
                  ),
                  _settingAction(
                    'Export Data',
                    'Download your profile and session data',
                    Icons.download,
                    () => _exportData(context),
                  ),
                  _settingAction(
                    'Reset Settings',
                    'Reset all settings to default values',
                    Icons.restart_alt,
                    () => _showResetDialog(context, ref),
                  ),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // About Section
              _settingsSection(
                'About',
                [
                  _settingInfo('Version', '1.0.0'),
                  _settingInfo('Build', 'Phase 7 Development'),
                  _settingInfo('API Status', 'Development Mode'),
                ],
              ),
              
              const SizedBox(height: WFDims.spacingXXL),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsSection(String title, List<Widget> children) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: WFTextStyles.h3),
          const SizedBox(height: WFDims.spacingL),
          ...children.expand((child) => [
            child,
            if (child != children.last) const SizedBox(height: WFDims.spacingM),
          ]).toList(),
        ],
      ),
    );
  }

  Widget _settingToggle(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
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

  Widget _settingDropdown(
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

  Widget _settingAction(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: WFDims.iconM, color: WFColors.purple400),
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
          Icon(Icons.chevron_right, size: WFDims.iconM, color: WFColors.gray500),
        ],
      ),
    );
  }

  Widget _settingInfo(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: WFTextStyles.labelLarge),
        ),
        Text(value, style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary)),
      ],
    );
  }

  Map<String, String> _getToneDisplayNames() {
    return {
      'brutal': 'Brutal (Savage)',
      'soft': 'Soft (Gentle)',
      'clinical': 'Clinical (Neutral)',
    };
  }

  Map<String, String> _getLanguageDisplayNames() {
    return {
      'eng': 'English',
      'spa': 'Spanish',
      'fra': 'French',
      'deu': 'German',
      'ita': 'Italian',
      'por': 'Portuguese',
    };
  }

  void _showClearHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('Clear History', style: WFTextStyles.h3),
        content: Text(
          'This will permanently delete all your saved analysis and mentor sessions. This action cannot be undone.',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: WFTextStyles.button.copyWith(color: WFColors.gray400)),
          ),
          WFPrimaryButton(
            text: 'Clear All',
            onPressed: () async {
              await CacheService.clearHistory();
              if (context.mounted) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('History cleared', style: WFTextStyles.bodySmall),
                    backgroundColor: WFColors.purple600,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _exportData(BuildContext context) {
    // Placeholder for data export functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Export functionality coming soon', style: WFTextStyles.bodySmall),
        backgroundColor: WFColors.purple600,
      ),
    );
  }

  void _showResetDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('Reset Settings', style: WFTextStyles.h3),
        content: Text(
          'This will reset all your settings to their default values. Your profile and history will not be affected.',
          style: WFTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: WFTextStyles.button.copyWith(color: WFColors.gray400)),
          ),
          WFPrimaryButton(
            text: 'Reset',
            onPressed: () {
              ref.read(appSettingsProvider.notifier).resetToDefaults();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Settings reset to defaults', style: WFTextStyles.bodySmall),
                  backgroundColor: WFColors.purple600,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
} 