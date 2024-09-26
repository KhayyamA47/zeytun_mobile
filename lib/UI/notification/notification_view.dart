// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
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
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zeytun_app/global/app_bar_detail.dart';
class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: ProjectDrower(),
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
        appBar: detailAppBar(
          context,
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
                      onTap: () => floatingActionNotification(context, notificationController.notificationList,index),
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


Future floatingActionNotification(BuildContext context, list, index) {

  // log("List ${list[index]}");
  // log("value ${value}");
  // log("files => ${list[index].files}");
  return showModalBottomSheet(
    isDismissible: true,
    context: context,
    // isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
    ),
    builder: (BuildContext context) {
      return DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      list[index].title.toString().length < 35
                          ? list[index].title
                          : list[index].title.toString().substring(0, 35) +
                          "...",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 81, 81, 81),
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    //put inside sized box
                    SizedBox(
                      height: 200,
                      child: InAppWebView(
                        gestureRecognizers: Set()
                          ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                        initialData: InAppWebViewInitialData(
                            data: list[index].body.toString()),
                        initialOptions: InAppWebViewGroupOptions(
                          android: AndroidInAppWebViewOptions(
                              useHybridComposition: true,
                              textZoom: 80,
                              builtInZoomControls: false),
                          crossPlatform: InAppWebViewOptions(
                            transparentBackground: true,
                            useShouldOverrideUrlLoading: true,
                            javaScriptCanOpenWindowsAutomatically: true,
                            javaScriptEnabled: true,
                            mediaPlaybackRequiresUserGesture: false,
                            preferredContentMode:
                            UserPreferredContentMode.MOBILE,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (list[index].files.isNotEmpty) ...[
                      ...list[index].files.map((item) {
                        return InkWell(
                          onTap: () async {
                            String url = item.link;
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalApplication);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.name,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      decorationThickness: 1.8)),
                              item.name
                                  .toString()
                                  .substring(item.name.length - 3)
                                  .contains("pdf")
                                  ? Image.asset(
                                "assets/zeytun/ic_pdf.png",
                                height: 24,
                                width: 20,
                                fit: BoxFit.cover,
                              )
                                  : Icon(
                                Icons.remove_red_eye,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                      // List.generate(items.length, (index) {
                      //   return   InkWell(
                      //     onTap: () async {
                      //       String url = list[index].files[0].link;
                      //       await launchUrl(Uri.parse(url),
                      //           mode: LaunchMode.externalApplication);
                      //     },
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Text(list[index].files[0].name,
                      //             style: TextStyle(
                      //                 color: Colors.blue,
                      //                 decoration: TextDecoration.underline,
                      //                 decorationColor: Colors.blue,
                      //                 decorationThickness: 1.8)),
                      //         Image.asset(
                      //           "assets/zeytun/ic_pdf.png",
                      //           height: 24,
                      //           width: 20,
                      //           fit: BoxFit.cover,
                      //         )
                      //       ],
                      //     ),
                      //   )
                      //           }),
                    ],
                    const SizedBox(height: 20),
                    PageButton(
                      onTap: () => Get.back(),
                      title: 'Bağla',
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
}
