// ignore_for_file: prefer_is_empty, depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/UI/important_information/method/list_companent.dart';
import 'package:zeytun_app/UI/important_information/widget/top.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/float_action_button.dart';
import '../../global/app_bar_detail.dart';
import '../../global/project_color.dart';

class ImportantInformation extends StatelessWidget {
  const ImportantInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: detailAppBar(context, title: "Vacib məlumatlar"),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InformationTop(),
            const SizedBox(height: 20),
            Obx(
              () => infoController.allBool.value
                  ? infoController.allList.length == 0

                      ? Center(
                          child: CircularProgressIndicator(color: mainColor))
                      : Expanded(
                          child:
                                  listCompanent(list: infoController.allList,value: 1,scrollController: infoController.scrollController))
                  : infoController.aksiyaBool.value
                      ? infoController.aksiyaList.length == 0
                          ? Center(
                              child:
                                  CircularProgressIndicator(color: mainColor))
                          : Expanded(
                              child: listCompanent(
                                      list: infoController.aksiyaList,value: 2,scrollController: infoController.scrollController)
                              )
                      : infoController.newBool.value
                          ? infoController.newList.length == 0
                              ? Center(
                                  child: CircularProgressIndicator(
                                      color: mainColor))
                              : Expanded(
                                  child: listCompanent(
                                          list: infoController.newList,value: 1,scrollController: infoController.scrollController)
                                              )
                          : infoController.waringBool.value
                              ? infoController.waringList.length == 0
                                  ? Center(
                                      child: CircularProgressIndicator(
                                          color: mainColor))
                                  : Expanded(
                                      child: listCompanent(
                                              list: infoController.waringList,value: 2,scrollController: infoController.scrollController)
                                )
                              : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
