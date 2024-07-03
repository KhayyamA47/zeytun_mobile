// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/global/project_color.dart';

showLoaderDialog() {
  Get.dialog(Container(
    child: Center(child: CircularProgressIndicator(color: mainColor)),
  ));
}
