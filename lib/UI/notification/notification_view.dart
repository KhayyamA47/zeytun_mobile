// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/app_bar.dart';
import 'package:zeytun_app/global/button.dart';
import 'package:zeytun_app/global/drawer.dart';
import 'package:zeytun_app/global/float_action_button.dart';
import '../../global/project_color.dart';
import 'package:flutter_html/flutter_html.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

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
          title: 'Bildirişlər',
        ),
        body: Obx(
          () => notificationController.notificationList.length == 0
              ? Center(child: CircularProgressIndicator(color: mainColor))
              : ListView.builder(
                  controller: notificationController.scrollController,
                  itemCount: notificationController.notificationList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => floatingActionNotification(context, index),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.campaign, color: mainColor),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            notificationController
                                                        .notificationList[index]
                                                        .title
                                                        .toString()
                                                        .length <
                                                    35
                                                ? notificationController
                                                    .notificationList[index]
                                                    .title
                                                    .toString()
                                                : notificationController
                                                        .notificationList[index]
                                                        .title
                                                        .toString()
                                                        .substring(0, 35) +
                                                    "...",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 81, 81, 81),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Html(
                                      style: {
                                        "body": Style(
                                          fontSize: FontSize(13.0),
                                          maxLines: 3,
                                          color: Color.fromARGB(
                                              255, 149, 148, 148),
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                      },
                                      shrinkWrap: true,
                                      data: notificationController
                                              .notificationList[index].body ??
                                          '',
                                    ),
                                  ),
                                  // Text(
                                  //   notificationController
                                  //           .notificationList[index].body ??
                                  //       '',
                                  //   maxLines: 3,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: TextStyle(
                                  //       color:
                                  //           Color.fromARGB(255, 149, 148, 148),
                                  //       fontSize: 13),
                                  // ),

                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        notificationController
                                            .notificationList[index]
                                            .senderData
                                            .name
                                            .toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 149, 148, 148),
                                            fontSize: 13),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.calendar_month,
                                        color:
                                            Color.fromARGB(255, 149, 148, 148),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        notificationController
                                            .notificationList[index].date
                                            .toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 149, 148, 148),
                                            fontSize: 13),
                                      ),
                                    ],
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
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ));
  }
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

Future floatingActionNotification(BuildContext context, index) {
  log("===> ${notificationController.notificationList[index].toString()}");
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
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
                    Text(_parseHtmlString(notificationController.notificationList[index].body)
                            .replaceAll("(<>)", "\n") ??
                        ''),
                    // Html(
                    //   shrinkWrap: true,
                    //   data:
                    //       notificationController.notificationList[index].body.replaceAll("(<>)","<br>") ??
                    //           '',
                    // ),
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
