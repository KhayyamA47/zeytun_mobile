// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/UI/important_information/method/information_buttons_value.dart';

import '../../../controller/controller_listner.dart/storage_manegment.dart';

class InformationTop extends StatelessWidget {
  const InformationTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Kateqoriya seçmək',
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Obx(() => informationValue(
              title: 'Hamısı',
              isTrue: infoController.allBool.value,
              onTap: () {
                infoController.buttonAll();
              })),
          const SizedBox(width: 10),
          Obx(() => informationValue(
              title: "Aksiyalar",
              isTrue: infoController.aksiyaBool.value,
              onTap: () {
                infoController.buttonAksiyalar();
              })),
        ]),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Obx(() => informationValue(
              title: 'Yeni mallar',
              isTrue: infoController.newBool.value,
              onTap: () {
                infoController.buttonNew();
              })),
          const SizedBox(width: 10),
          Obx(() => informationValue(
              title: "Xəbərdarlıqlar",
              isTrue: infoController.waringBool.value,
              onTap: () {
                infoController.buttonWaring();
              })),
        ]),
      ],
    );
  }
}
