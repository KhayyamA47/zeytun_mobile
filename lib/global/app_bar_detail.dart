// ignore_for_file: depend_on_referenced_packages, avoid_unnecessary_containers, prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller_listner.dart/storage_manegment.dart';

AppBar detailAppBar(BuildContext context,
    {search = true, main = true, title = '', icon}) {
  return AppBar(
    iconTheme: IconThemeData(color: Color(0x8F000000)),
    backgroundColor: const Color(0xFFFFFFFF),
    title: title.toString().length == 0
        ? Obx(
            () => Text(
              detailController.title.value,
              style: TextStyle(
                  color: const Color(0x8F000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          )
        : Text(
            title,
            style: TextStyle(
                color: const Color(0x8F000000),
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
  );
}
