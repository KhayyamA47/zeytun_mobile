// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'dart:developer';

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/notification_list.dart';
import 'package:zeytun_app/data/model/information_model.dart';
class NotificationDataSource {
  Future<InformationModel?> getNotifications(page) async {
    try {
      var response = await clientDio
          .get("${NetworkPath.NOTIFICATIONS.rawValue}?page=$page");
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return InformationModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
