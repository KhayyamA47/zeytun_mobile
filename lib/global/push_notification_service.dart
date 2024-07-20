import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentSound: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'Ist Market Notifications',
            importance: Importance.max,priority: Priority.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    log("Notification showed...");
    return notificationsPlugin.show(
        id, title, body, notificationDetails());
  }
  Future closeNotification() async {
    notificationsPlugin.cancel(0);
  }
  Future closeAllNotification() async {
    log("Notifications closed");

    notificationsPlugin.cancelAll();
  }
  Future activeNotification() async {
    log("Notification active...");
    return notificationsPlugin.getActiveNotifications();
  }

}

