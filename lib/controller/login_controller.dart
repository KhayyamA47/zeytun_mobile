// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/core/notification/notification.dart';
import 'package:zeytun_app/data/data_source/login_data_source.dart';
import 'package:zeytun_app/global/alert_dialog.dart';
import 'package:zeytun_app/global/check_email.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zeytun_app/global/loader_dialog.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';
import 'package:zeytun_app/services/user_service.dart';

class LoginController extends GetxController {
  var welcome = "Daxil olmaq".obs;
  var _passType = true.obs;

  get passType => _passType;
  final UserService _userService = UserService();
  var user = Rxn<PharmacyListModelData>();

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  Future<void> _loadUser() async {
    user.value = await _userService.getUser();
  }

  Future<void> saveUser(PharmacyListModelData user) async {
    await _userService.saveUser(user);
    this.user.value = user;
  }

  Future<void> deleteUser() async {
    await _userService.deleteUser();
    user.value = null;
  }

  set passType(newValue) {
    _passType = newValue;
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(context) async {
    showLoaderDialog();
    final storage = FlutterSecureStorage();
    final getStorage = GetStorage();
    if (checkEmail(email.text)) {
      if (password.text.length > 6) {
        var data = {
          "email": email.text,
          "password": password.text,
          "fcm_token": await getDeviceToken()
        };
        LoginDataSource().login(data).then((value) async {
          if (value != null) {
            log("login pharmacy => ${value.data!.pharmacy!.toJson()}");
            saveUser(PharmacyListModelData.fromJson(value.data!.pharmacy!.toJson()));
            await storage.write(key: "token", value: value.data!.accessToken);
            await getStorage.write("login", true);
            if (homeController.pharmacyList.isNotEmpty) {
              homeController.getPharmacyList();
            }
            Get.offAllNamed('/main');
          } else {
            Get.back();
            showMyDialog(context,
                title: "Xəta",
                subTitle: "Daxil olma zamanı xəta baş verdi",
                buttonName: "Aydındır", buttonOnTap: () {
              Navigator.of(context).pop();
            });
          }
        });
      } else {
        Get.back();
        showMyDialog(context,
            title: "Xəta",
            subTitle: "Şifrə 6 simvoldan az ola bilməz",
            buttonName: "Aydındır", buttonOnTap: () {
          Navigator.of(context).pop();
        });
      }
    } else {
      Get.back();
      showMyDialog(context,
          title: "Xəta",
          subTitle: "Email düzgün formatda deyil",
          buttonName: "Aydındır", buttonOnTap: () {
        Navigator.of(context).pop();
      });
    }
  }
}
