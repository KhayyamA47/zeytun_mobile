import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/data/data_source/notification_data_source.dart';
import 'package:zeytun_app/global/loader_dialog.dart';

class NotificationController extends GetxController {
  final ScrollController scrollController = ScrollController();

  var notificationList = [].obs;
  var page = 0.obs;
  Future getAllNotification() async {
    notificationList.clear();
    NotificationDataSource().getNotifications(page).then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.length; i++) {
          notificationList.add(value.data![i]);
        }
      }
    });
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      page.value++;
      showLoaderDialog();
      NotificationDataSource().getNotifications(page.value).then((value) {
        if (value != null) {
          for (var i = 0; i < value.data!.length; i++) {
            notificationList.add(value.data![i]);
          }
          Get.back();
        }
      });
    }
  }

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
