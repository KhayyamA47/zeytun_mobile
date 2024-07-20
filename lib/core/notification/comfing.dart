// ignore_for_file: avoid_print


import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/core/notification/notification.dart';
import 'package:zeytun_app/global/push_notification_service.dart';

Future handler() async {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {});
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? androidNotification = message.notification?.android;
log("notification $notification");
    if (notification != null && androidNotification != null) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(chanel);
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: true, badge: true, sound: true);
    }

    if (Platform.isAndroid) {
      PushNotificationService().showNotification(
          title: message.notification!.title,
          body: message.notification!.body);
    }    // if (message.notification != null) {
    //   Get.defaultDialog(
    //       title: message.notification!.body.toString(),
    //       middleText: message.notification!.title.toString());
    // }
  });
}
