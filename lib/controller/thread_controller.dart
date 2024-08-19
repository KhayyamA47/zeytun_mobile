import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/data/data_source/chat_data_source.dart';
import 'package:zeytun_app/data/model/chat_model.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';
import 'package:zeytun_app/global/alert_dialog.dart';
import 'dart:convert';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';
import 'package:zeytun_app/services/user_service.dart';
import 'package:zeytun_app/global/loader_dialog.dart';

class ThreadController extends GetxController {
  var chatList = [].obs;
  final UserService _userService = UserService();
  var user = Rxn<PharmacyListModelData>();

  int page = 0;
  bool isLoading = false;
  bool isEnd = false;
  Thread thread=Thread();
  TextEditingController messageController = TextEditingController();

  Future getThread() async {
    if (page==0){
      chatList.clear();
    }
    isLoading = true;
    log("thread controller get message list start *******");
    log ("thread id => ${thread.id}");
    ChatDataSource().getMessageList(threadId: thread.id).then((value) {
      log("threadcontroller getchatlist => $value");
      if (value != null) {

        for (var i = 0; i < value.length; i++) {
          chatList.add(value[i]);
        }
        isLoading = false;
        if (value.length == 0) {
          isEnd = true;
        }
      }
    });
    return chatList;
  }


  void openUrl(String url,context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showMyDialog(context,
          title: "Xəta",
          subTitle: 'Link açılmadı',
          buttonName: "Aydındır",
          buttonOnTap: () {

          });
    }
  }
  Future sendMessage() async {
    ChatDataSource().sendMessage(threadId: thread.id!, message: messageController.text).then((value) {
      log("threadcontroller send message => $value");
      if (value != null) {
        page=0;
        // messageController.clear();
        getThread();
      }
    });
  }

  Future<void> _loadUser() async {
    user.value = await _userService.getUser();
    log(user.value.toString());
  }

  @override
  void onInit() {
    // thread=Get.arguments;
    _loadUser();
    log("thread controller on init");
    getThread();
    super.onInit();
  }
}