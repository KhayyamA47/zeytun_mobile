import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/data_source/chat_data_source.dart';
import 'package:zeytun_app/data/model/data_model.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';
import 'package:zeytun_app/data/model/reports_model.dart';
import 'package:zeytun_app/global/overlay_loader.dart';
import 'package:zeytun_app/services/user_service.dart';
import 'dart:developer';
import '../../global/project_color.dart';
import '../../global/app_bar_detail.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  ReportsModel? dataModel;

  PharmacyListModelData? user;
  TextEditingController controller = TextEditingController();
  final ItemScrollController _scrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    getUser();
    getReposts().then((value) {
      if (value != null) {
        setState(() {
          dataModel = value;
        });
      }
    });
  }

  Future getReposts({int page = 0}) async {
    try {
      var response =
          await clientDio.get('${NetworkPath.REPORTS.rawValue}?page=$page');
      if (response.statusCode == 200) {
        final data = ReportsModel.fromJson(response.data);
        setState(() {});
        return data;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getUser() async {
    final userService = UserService();
    user = await userService.getUser();
    setState(() {});
    log("user== $user");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: detailAppBar(context, title: "Kassa qəbzləri"),
        body: dataModel == null || user == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [threadBox(dataModel!.data!.messages), input()],
              ));
  }

  input() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Mesaj yazın",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Loader.show(context);
              ChatDataSource()
                  .sendMessage(
                      threadId: dataModel!.data!.thread!.first.id!,
                      message: controller.text)
                  .then((value) {
                if (value != null) {
                  getReposts().then((value) {
                    if (dataModel!.data!.messages!.isEmpty) {
                      Get.back();
                    }
                    ReportsModel data = value;
                    dataModel!.data!.messages!.add(data.data!.messages!.last);
                    setState(() {});
                    _scrollController.scrollTo(
                        index: dataModel!.data!.messages!.length,
                        duration: const Duration(milliseconds: 300));
                    controller.clear();
                    Loader.hide();
                  });
                }
              });
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  sendMessageMethod(var id) async {
    await ChatDataSource()
        .sendMessage(threadId: id, message: controller.text)
        .then((value) {
      if (value != null) {
        log("IMD $value");
        return value;
      }
    });
  }

  threadBox(list) {
    log(list.length.toString());
    // check sender id if it is equal to user id, show it right side, else show left side.
    // Add avatar to left side
    // add input field to bottom of the page and send button, when send button clicked, add message to list and send to server
    return Expanded(
      child: ScrollablePositionedList.builder(
        itemCount: list.length,
        itemScrollController: _scrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //chat like whatsapp

                    if (user != null && list[index].recipient == user!.id)
                      Column(children: [
                        Text(
                          list[index].date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  list[index].body ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (list[index].file != null)
                          Image(
                            image: NetworkImage(list[index].file),
                            height: 150,
                          ),
                      ]),
                    if (user != null && list[index].sender == user!.id)
                      Column(children: [
                        Text(
                          list[index].date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                list[index].body ?? '',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        if (list[index].file != null)
                          Image(
                            image: NetworkImage(list[index].file),
                            height: 150,
                          ),
                      ]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
