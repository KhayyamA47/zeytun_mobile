// ignore_for_file: depend_on_referenced_packages, must_be_immutable, prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeytun_app/blinding/blinding.dart';
import 'package:zeytun_app/core/notification/comfing.dart';
import 'package:zeytun_app/core/notification/notification.dart';
import 'package:zeytun_app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await GetStorage.init();
  var _getStorage = GetStorage();

  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 1));

  getDeviceToken();
  FirebaseMessaging.onBackgroundMessage(firebaseMessageNotification);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(chanel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  await handler();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialBinding: HomeBinding(),
      title: 'Zeytun Pharmacy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: _getStorage.read('login') == true ? '/main' : '/',
      getPages: AppPages.pages,
    ),
  );
}
