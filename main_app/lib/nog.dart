import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        if (notificationResponse.payload != null) {
          _rescheduleNotification(notificationResponse.payload!);
        }
      },
    );

    tz.initializeTimeZones();
  }

  static void showNotification(
      String productName, DateTime date, String tekrar) async {
    var timeParts = tekrar.split(":");
    if (timeParts.length != 3) {
      throw FormatException('Invalid time format, expected HH:mm:ss');
    }

    var hours = int.tryParse(timeParts[0]) ?? 0;
    var minutes = int.tryParse(timeParts[1]) ?? 0;
    var seconds = int.tryParse(timeParts[2]) ?? 0;

    var scheduledNotificationDateTime =
        tz.TZDateTime.from(date, tz.local).add(Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    ));

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your_channel_id', 'your_channel_name',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'تذكير',
      'لا تنسى $productName',
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      payload: '$productName:$tekrar',
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static void _rescheduleNotification(String payload) async {
    var payloadParts = payload.split(":");
    if (payloadParts.length < 4) {
      return;
    }

    var productName = payloadParts[0];
    var timeParts = payloadParts.sublist(1, 4);
    var hours = int.tryParse(timeParts[0]) ?? 0;
    var minutes = int.tryParse(timeParts[1]) ?? 0;
    var seconds = int.tryParse(timeParts[2]) ?? 0;

    var scheduledNotificationDateTime =
        tz.TZDateTime.now(tz.local).add(Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    ));

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your_channel_id', 'your_channel_name',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'تذكير',
      'لا تنسى $productName',
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static void cancelNotification(String productName) async {
    var notifications =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    for (var notification in notifications) {
      if (notification.payload?.startsWith(productName) ?? false) {
        await flutterLocalNotificationsPlugin.cancel(notification.id);
      }
    }
  }
}
