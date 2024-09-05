import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/drawer.dart';
import 'package:zeytun_app/routes/app_routes.dart';
import 'dart:developer';
import '../../global/app_bar.dart';
import '../../global/float_action_button.dart';
import '../../global/project_color.dart';
import '../../global/app_bar_detail.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: detailAppBar(context, title: "Chat"),
        floatingActionButton: CircleAvatar(
            radius: 28,
            backgroundColor: mainColor,
            child: IconButton(
              onPressed: () {
                floatingAction(context);
                // homeController.getPharmacyList();
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Obx(
              () => Container(
                child:(chatController.chatList.isEmpty
                        ? const Center(
                            child: Text('Açıq mövzu yoxdur!',
                                style: TextStyle(fontSize: 20)))
                        : chatList(chatController.chatList)),
              ),
            ),
          ],
        ));
  }
}

Expanded chatList(list) {
  return Expanded(
    child: ListView.builder(
      itemCount: list.length,
      //scroll to the end
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: ListTile(
              title: Text(list[index].name),
              onTap: () {
                threadController.thread = list[index];
                Get.toNamed(AppRoutes.THREAD, arguments: list[index]);
                threadController.getThread();
              },
            ),
          ),
        );
      },
    ),
  );
}
