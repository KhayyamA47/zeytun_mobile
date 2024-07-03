import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/data/data_source/settings_data_source.dart';

class SettingsControlle extends GetxController {
  TextEditingController initialPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController repaitPassword = TextEditingController();
  var onePassType = true.obs;
  var twoPassType = true.obs;
  var threePassType = true.obs;
  Future changePassword() async {
    if (initialPassword.text.length >= 6 && newPassword.text.length >= 6 ||
        repaitPassword.text.length >= 6) {
      SettingsDataSource()
          .changePassword(initialPassword.text, newPassword.text)
          .then((value) {
        if (value == true) {
          initialPassword.clear();
          newPassword.clear();
          repaitPassword.clear();
          Get.back();
          Get.back();
          Get.defaultDialog(
              title: 'Xəta', middleText: 'Şifrələr uğurla dəyişdirildi');
        } else {
          Get.back();
          Get.defaultDialog(title: 'Xəta', middleText: 'Xəta baş verdi');
        }
      });
    } else {
      Get.back();
      Get.defaultDialog(
          title: 'Xəta', middleText: 'Şifrələr 6 simvoldan az ola bilməz');
    }
  }
}
