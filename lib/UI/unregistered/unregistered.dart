// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/app_bar.dart';
import 'package:zeytun_app/global/button.dart';
import 'package:zeytun_app/global/drawer.dart';
import 'package:zeytun_app/global/float_action_button.dart';
import '../../global/project_color.dart';
import 'package:flutter_html/flutter_html.dart';

class UnregisteredView extends StatelessWidget {
  const UnregisteredView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProjectDrower(),
        floatingActionButton: CircleAvatar(
            radius: 28,
            backgroundColor: mainColor,
            child: IconButton(
              onPressed: () {
                floatingAction(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
        appBar: projectAppBAr(
          context,
          search: false,
          main: false,
          title: 'Daxil olmamaış apteklər',
          // icon: Icon(
          //   Icons.person,
          //   color: Color.fromARGB(255, 223, 223, 223),
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'PROFİLƏ DAXİL OLMAMIŞ APTEKLƏR',
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(height: 15),
              Obx(
                () => unregisteredController
                            .unregisteredControllerList.length ==
                        0
                    ? Center(child: CircularProgressIndicator(color: mainColor))
                    : Expanded(
                        child: SingleChildScrollView(
                          controller: unregisteredController.scrollController,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: unregisteredController
                                  .unregisteredControllerList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    detailController.title.value =
                                        unregisteredController
                                            .unregisteredControllerList[index]
                                            .name
                                            .toString();
                                    detailController.id.value =
                                        unregisteredController
                                            .unregisteredControllerList[index]
                                            .id;
                                    Get.toNamed('/detail');
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        unregisteredController
                                                    .unregisteredControllerList[
                                                        index]
                                                    .name
                                                    .toString()
                                                    .length <
                                                35
                                            ? unregisteredController
                                                .unregisteredControllerList[
                                                    index]
                                                .name
                                            : unregisteredController
                                                    .unregisteredControllerList[
                                                        index]
                                                    .name
                                                    .toString()
                                                    .substring(0, 35) +
                                                "...",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 81, 81, 81),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        unregisteredController
                                                    .unregisteredControllerList[
                                                        index]
                                                    .address
                                                    .toString()
                                                    .length <
                                                35
                                            ? unregisteredController
                                                .unregisteredControllerList[
                                                    index]
                                                .address
                                            : unregisteredController
                                                    .unregisteredControllerList[
                                                        index]
                                                    .address
                                                    .toString()
                                                    .substring(0, 35) +
                                                "...",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 81, 81, 81),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),

                                      /// index != list.lengt
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        width: double.infinity,
                                        height: 1,
                                        color: Color(0xFFd1d1d2),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}

Future floatingActionNotification(BuildContext context, index) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.99,
        builder: (BuildContext context, ScrollController scrollController) {
          return DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      notificationController.notificationList[index].title
                                  .toString()
                                  .length <
                              35
                          ? notificationController.notificationList[index].title
                          : notificationController.notificationList[index].title
                                  .toString()
                                  .substring(0, 35) +
                              "...",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color.fromARGB(255, 81, 81, 81),
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    Html(
                      shrinkWrap: true,
                      data:
                          notificationController.notificationList[index].body ??
                              '',
                    ),
                    const SizedBox(height: 20),
                    PageButton(
                      onTap: () => Get.back(),
                      title: 'Bağıa',
                      color: mainColor,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
