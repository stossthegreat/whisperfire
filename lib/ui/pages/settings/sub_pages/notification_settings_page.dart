import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../../atoms/atoms.dart';

class NotificationSettingsPage extends ConsumerStatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  ConsumerState<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends ConsumerState<NotificationSettingsPage> {
  bool _studyRemindersEnabled = true;
  String _studyReminderTime = '09:00';
  String _studyReminderFrequency = 'daily';
  bool _achievementAlerts = true;
  bool _newContentNotifications = true;
  bool _hapticFeedback = true;
  bool _soundEffects = true;
  bool _pushNotifications = true;
  bool _emailNotifications = false;

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
        title: Text('Notifications', style: WFTextStyles.h3),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Study Reminders Section
              _buildSection(
                'Study Reminders',
                Icons.schedule,
                [
                  _buildToggleTile(
                    'Enable Study Reminders',
                    'Get notified to practice regularly',
                    _studyRemindersEnabled,
                    (value) => setState(() => _studyRemindersEnabled = value),
                  ),
                  if (_studyRemindersEnabled) ...[
                    _buildDropdownTile(
                      'Reminder Time',
                      'When to send daily study reminders',
                      _studyReminderTime,
                      ['06:00', '09:00', '12:00', '15:00', '18:00', '21:00'],
                      {
                        '06:00': '6:00 AM',
                        '09:00': '9:00 AM',
                        '12:00': '12:00 PM',
                        '15:00': '3:00 PM',
                        '18:00': '6:00 PM',
                        '21:00': '9:00 PM',
                      },
                      (value) => setState(() => _studyReminderTime = value),
                    ),
                    _buildDropdownTile(
                      'Frequency',
                      'How often to send reminders',
                      _studyReminderFrequency,
                      ['daily', 'weekdays', 'every_other_day'],
                      {
                        'daily': 'Every day',
                        'weekdays': 'Monday to Friday',
                        'every_other_day': 'Every other day',
                      },
                      (value) => setState(() => _studyReminderFrequency = value),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Achievement & Progress Section
              _buildSection(
                'Achievements & Progress',
                Icons.emoji_events,
                [
                  _buildToggleTile(
                    'Achievement Alerts',
                    'Notify when you level up or unlock new content',
                    _achievementAlerts,
                    (value) => setState(() => _achievementAlerts = value),
                  ),
                  _buildToggleTile(
                    'New Content Notifications',
                    'Alert when new lessons or categories are available',
                    _newContentNotifications,
                    (value) => setState(() => _newContentNotifications = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Feedback & Haptics Section
              _buildSection(
                'Feedback & Haptics',
                Icons.vibration,
                [
                  _buildToggleTile(
                    'Haptic Feedback',
                    'Vibration feedback on interactions',
                    _hapticFeedback,
                    (value) => setState(() => _hapticFeedback = value),
                  ),
                  _buildToggleTile(
                    'Sound Effects',
                    'Audio feedback for actions and achievements',
                    _soundEffects,
                    (value) => setState(() => _soundEffects = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Notification Channels Section
              _buildSection(
                'Notification Channels',
                Icons.notifications,
                [
                  _buildToggleTile(
                    'Push Notifications',
                    'Receive notifications on your device',
                    _pushNotifications,
                    (value) => setState(() => _pushNotifications = value),
                  ),
                  _buildToggleTile(
                    'Email Notifications',
                    'Get updates via email',
                    _emailNotifications,
                    (value) => setState(() => _emailNotifications = value),
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingL),

              // Quiet Hours Section
              _buildSection(
                'Quiet Hours',
                Icons.bedtime,
                [
                  _buildTimeRangeTile(
                    'Do Not Disturb',
                    'Set times when notifications are silenced',
                    '22:00',
                    '07:00',
                    (start, end) {},
                  ),
                ],
              ),

              const SizedBox(height: WFDims.spacingXXL),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveNotificationSettings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WFColors.purple400,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                    ),
                  ),
                  child: Text(
                    'Save Notification Settings',
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

  Widget _buildTimeRangeTile(
    String title,
    String subtitle,
    String startTime,
    String endTime,
    Function(String, String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: WFTextStyles.labelLarge),
        const SizedBox(height: 2),
        Text(subtitle, style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary)),
        const SizedBox(height: WFDims.spacingS),
        Row(
          children: [
            Expanded(
              child: _buildTimePicker(
                'Start Time',
                startTime,
                (time) => onChanged(time, endTime),
              ),
            ),
            const SizedBox(width: WFDims.spacingM),
            Expanded(
              child: _buildTimePicker(
                'End Time',
                endTime,
                (time) => onChanged(startTime, time),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimePicker(String label, String time, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: WFTextStyles.bodySmall.copyWith(color: WFColors.textSecondary)),
        const SizedBox(height: 4),
        InkWell(
          onTap: () => _showTimePicker(context, time, onChanged),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: WFColors.gray800.withOpacity(0.5),
              borderRadius: BorderRadius.circular(WFDims.radiusSmall),
              border: Border.all(color: WFColors.glassBorder),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time, style: WFTextStyles.bodyMedium),
                Icon(Icons.access_time, color: WFColors.textTertiary, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showTimePicker(BuildContext context, String currentTime, Function(String) onChanged) {
    final timeParts = currentTime.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: hour, minute: minute),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: WFColors.purple400,
            ),
          ),
          child: child!,
        );
      },
    ).then((time) {
      if (time != null) {
        final formattedTime = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
        onChanged(formattedTime);
      }
    });
  }

  void _saveNotificationSettings() {
    // TODO: Implement saving notification settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification settings saved'),
        backgroundColor: Colors.green,
      ),
    );
  }
} 