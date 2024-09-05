// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeytun_app/UI/login/login.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/global/project_color.dart';
import "package:flutter_secure_storage/flutter_secure_storage.dart";

import '../core/dio/dio_confing.dart';

class ProjectDrower extends StatelessWidget {
  const ProjectDrower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFFFFFFF),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 25,
                            color: mainColor,
                          ))
                    ],
                  ),
                  drawerButton(context,
                      text: 'Apteklərim', img: 'ic_pharmacies', onPress: () {
                    Get.back();
                    Get.toNamed('/main');
                  }),
                  drawerButton(context, text: 'İşçilər', img: 'ic_unpharmacies',
                      onPress: () {
                    selectPharmacyController.title.value =
                        'İşçilərini görmək istədiyiniz apteki seçin.';
                    selectPharmacyController.sectionId.value = 1;
                    Get.back();
                    Get.toNamed('/select/pharmacy');
                  }),
                  drawerButton(context, text: 'Bildirişlər', img: 'ic_bell',
                      onPress: () {
                    notificationController.getAllNotification();
                    Get.back();
                    Get.toNamed('/notification');
                  }),
                  drawerButton(context,
                      text: 'Hesabat',
                      img: 'iconReports-removebg-preview', onPress: () {
                    selectPharmacyController.title.value =
                        'Hesabatını görmək istədiyiniz apteki seçin.';
                    selectPharmacyController.sectionId.value = 2;
                    Get.back();
                    Get.toNamed('/select/pharmacy');
                  }),
                  drawerButton(context,
                      text: 'Ödənişlər',
                      img: 'iconPayments-removebg-preview', onPress: () {
                    selectPharmacyController.title.value =
                        'Ödənişlərini görmək istədiyiniz apteki seçin.';
                    selectPharmacyController.sectionId.value = 3;
                    Get.back();
                    Get.toNamed('/select/pharmacy');
                  }),
                  drawerButton(context,
                      text: 'Vacib məlumatlar',
                      img: 'iconInfo-removebg-preview', onPress: () {
                    Get.back();
                    infoController.buttonAll();
                    Get.toNamed("/info");
                  }),
                  drawerButton(context,
                      text: 'Chat',
                      img: 'ic_chat_fab',
                      onPress: () {
                        chatController.page = 0;
                        chatController.getChatList(str:"Drawer");
                        Get.back();
                        Get.toNamed("/chat");
                      }),
                  drawerButton(context,
                      text: 'Qaimələr',
                      img: 'iconReports-removebg-preview',
                      onPress: () {
                        chatController.getChatList(str:"Drawer");
                        Get.back();
                        Get.toNamed("/invoices");
                      }),
                  drawerButton(context, text: 'Əlaqələr', img: 'ic_contactss',
                      onPress: () {
                    Get.back();
                    detailController.getContact(context);
                    Get.toNamed("/contact");
                  }),
                ],
              ),
              Positioned.fill(
                  bottom: 32,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: double.infinity,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  settingsControlle.initialPassword.clear();
                                  settingsControlle.newPassword.clear();
                                  settingsControlle.repaitPassword.clear();
                                  Get.back();
                                  Get.toNamed('/settings');
                                },
                                child: Row(children: const [
                                  Icon(
                                    Icons.settings,
                                    color: Color(0xFF828297),
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Ayarlar',
                                    style: TextStyle(color: Color(0xFF828297)),
                                  )
                                ]),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () async {
                                  final storage = FlutterSecureStorage();
                                  final getStorage = GetStorage();

                                  await storage.delete(key: "token");
                                  getStorage.remove("login");
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginView()),
                                      (route) => false);
                                  await clientDio
                                      .post(NetworkPath.LOGOUT.rawValue);
                                },
                                child: Row(children: [
                                  Image.asset(
                                    'assets/zeytun/ic_logout.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Çıxış',
                                      style:
                                          TextStyle(color: Color(0xFF828297))),
                                ]),
                              ),
                            ],
                          )))),
            ],
          ),
        ),
      ),
    );
  }

  TextButton drawerButton(BuildContext context,
      {required text, img, required onPress}) {
    return TextButton(
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      onPressed: onPress,
      child: Row(
        children: [
          Image.asset(
            'assets/zeytun/$img.png',
            width: 20,
            height: 20,
            color: mainColor,
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: mainColor),
          ),
        ],
      ),
    );
  }
}
