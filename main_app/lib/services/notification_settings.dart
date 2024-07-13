import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import 'notification_service.dart';

class NotificationSettings {
  int _interval = 0;
  String _productName;
  String _etkit;
  Color _color;
  String _hour;
  String _minute;
  String _second;
  BuildContext _context;

  NotificationSettings({
    required String productName,
    required String etkit,
    required Color color,
    required String hour,
    required String minute,
    required String second,
    required BuildContext context,
  })  : _productName = productName,
        _etkit = etkit,
        _color = color,
        _hour = hour,
        _minute = minute,
        _second = second,
        _context = context;

  int _calculateInterval() {
    int hours = int.parse(_hour);
    int minutes = int.parse(_minute);
    int seconds = int.parse(_second);
    if (seconds < 5) {
      seconds = 5;
    }

    _interval = (hours * 3600) + (minutes * 60) + seconds;
    return _interval;
  }

  void _scheduleNotificationIfNeeded() {
    _calculateInterval();
    NotificationService.showNotification(
      title: _productName,
      body: _etkit,
      scheduled: true,
      interval: _interval,
      payload: {"navigate": "true"},
      actionButtons: [
        NotificationActionButton(
          key: 'check',
          label: S.of(_context).checkit,
          actionType: ActionType.SilentAction,
          color: _color,
        ),
      ],
    );
  }

  void scheduleNotification() {
    _scheduleNotificationIfNeeded();
  }
}
