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

class LoginController extends GetxController {
  var welcome = "Daxil olmaq".obs;
  var _passType = true.obs;

  get passType => _passType;

  set passType(newValue) {
    _passType = newValue;
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(context) async {
    showLoaderDialog();
    final storage = FlutterSecureStorage();
    final getStorage = GetStorage();
    log(">>>> ${await getDeviceToken()}");
    if (checkEmail(email.text)) {
      if (password.text.length > 6) {
        var data = {
          "email": email.text,
          "password": password.text,
          "fcm_token": await getDeviceToken()
        };
        LoginDataSource().login(data).then((value) async {
          if (value != null) {
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
