// ignore_for_file: depend_on_referenced_packages, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeytun_app/global/button.dart';
import 'package:zeytun_app/global/project_color.dart';
import 'package:flutter_html/flutter_html.dart';

// import gesture recognizer
import 'package:flutter/gestures.dart';

Padding listCompanent(
    {required list, required int value, required scrollController}) {
  // log(list[0].body.toString());

  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: SingleChildScrollView(
      controller: scrollController,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => Column(
          children: [
            InkWell(
              onTap: () {
                floatingActionNotification(context, list, index, value);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/zeytun_image.png')),
                  // const SizedBox(width: 16),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(list[index].title.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child:
                                //check if title is not null

                                Text(list[index].title.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: mainColor,
                                        fontWeight: FontWeight.w700)),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Html(
                              style: {
                                "body": Style(
                                  fontSize: FontSize(13.0),
                                  maxLines: 3,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                              },
                              onLinkTap: (url, _, __) async {
                                log("link $url");
                                await launchUrl(Uri.parse(url!));
                              },
                              shrinkWrap: true,
                              data: list[index].body.toString() ?? '',
                            ),
                          ),
                          // Text(list[index].body.toString(),
                          //     maxLines: 3,
                          //     overflow: TextOverflow.ellipsis,
                          //     style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Text(list[index].senderData.name.toString(),
                                    style: TextStyle(fontSize: 12)),
                                const SizedBox(width: 4),
                                const CircleAvatar(radius: 1),
                                const SizedBox(width: 4),
                                const Icon(Icons.calendar_month, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  list[index].date,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(width: double.infinity, height: 1, color: Colors.black12),
            const SizedBox(height: 10)
          ],
        ),
      ),
    ),
  );
}

Future floatingActionNotification(BuildContext context, list, index, value) {
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
      return DraggableScrollableSheet(
        initialChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
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
                              textZoom: 270,
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
                                    Image.asset(
                                      "assets/zeytun/ic_pdf.png",
                                      height: 24,
                                      width: 20,
                                      fit: BoxFit.cover,
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
    },
  );
}
