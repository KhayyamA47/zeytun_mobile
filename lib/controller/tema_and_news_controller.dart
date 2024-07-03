import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppealController extends GetxController {
  var hintText = 'Default text'.obs;
  TextEditingController tema = TextEditingController();
  TextEditingController text = TextEditingController();

  void changeHintText(String text) {
    hintText.value = text;
  }

  Future createAppeal() async {}
}
