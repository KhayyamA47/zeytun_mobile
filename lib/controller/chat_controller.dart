import 'dart:developer';
import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeytun_app/controller/user_controller.dart';
import 'package:zeytun_app/data/data_source/chat_data_source.dart';
import 'package:zeytun_app/global/alert_dialog.dart';
import 'package:zeytun_app/services/user_service.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';
class ChatController extends GetxController {
  var chatList = [].obs;
  final UserService _userService = UserService();
  var user = Rxn<PharmacyListModelData>();

  int page = 0;
  bool isLoading = false;
  bool isEnd = false;

  Future getChatList({String str="Default"}) async {
    if (page==0){
      chatList.clear();
    }
    isLoading = true;
    ChatDataSource().getChatList(page: page).then((value) {
      if (value != null) {
        log("****************** chat controller get  => ${str}");
        log("****************** chat controller get chat list value => ${value}");
        for (var i = 0; i < value.length; i++) {
          // log(value[i].toJson().toString());
          chatList.add(value[i]);
        }
        isLoading = false;
        if (value.length == 0) {
          isEnd = true;
        }
      }
    });
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
  Future<void> _loadUser() async {
    user.value = await _userService.getUser();
    log(user.value.toString());
  }
  Future createThread(name,body,file) async {
    try {
      var response = await ChatDataSource().createThread(thread_name: name, body: body,files: file);
      log("thread controller create thread response => ${response}");
      if (response != null) {
        return response;
      }
    } catch (e) {
      print(e);
    }
  }
  void onCreated() {
    page = 0;
    // getChatList(str:"onCreated");
  }

  @override
  void onInit(){
      _loadUser();
      super.onInit();
  }

  @override
  void onReady() {
    _loadUser();
    log("chat controller oninit");
    log(user.value.toString());
    // getChatList(str:"onReady");
    super.onReady();
  }
}