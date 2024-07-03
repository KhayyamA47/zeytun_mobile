// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zeytun_app/core/notification/notification.dart';

Future handler() async {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {});
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? androidNotification = message.notification?.android;

    if (notification != null && androidNotification != null) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(chanel);
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: true, badge: true, sound: true);
    }

    // if (message.notification != null) {
    //   Get.defaultDialog(
    //       title: message.notification!.body.toString(),
    //       middleText: message.notification!.title.toString());
    // }
  });
}
