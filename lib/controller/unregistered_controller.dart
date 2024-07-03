import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/data/data_source/unregistered_data_source.dart';
import 'package:zeytun_app/global/loader_dialog.dart';

class UnregisteredController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var unregisteredControllerList = [].obs;
  var page = 0.obs;
  Future getUnregistered() async {
    UnregisteredDataSource().getUnregistered(page).then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.length; i++) {
          unregisteredControllerList.add(value.data![i]);
        }
      }
    });
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      page.value++;
      showLoaderDialog();
      UnregisteredDataSource().getUnregistered(page).then((value) {
        if (value != null) {
          for (var i = 0; i < value.data!.length; i++) {
            unregisteredControllerList.add(value.data![i]);
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
