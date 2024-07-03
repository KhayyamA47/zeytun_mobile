import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel chanel = AndroidNotificationChannel(
    'id', 'name',
    description: 'title',
    importance: Importance.high,
    playSound: true,
    enableLights: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<String?> getDeviceToken() async {
  await Firebase.initializeApp();
  print(await FirebaseMessaging.instance.getToken());
  print("//////" * 20);
  return await FirebaseMessaging.instance.getToken();
}

Future<void> firebaseMessageNotification(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
