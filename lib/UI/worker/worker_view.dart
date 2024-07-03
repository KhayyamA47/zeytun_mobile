// ignore_for_file: prefer_is_empty, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import '../../global/app_bar_detail.dart';
import '../../global/project_color.dart';

class WorkerView extends StatelessWidget {
  const WorkerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAppBar(context),
      body: Obx(() => workerController.workerList.length == 0
          ? Center(child: CircularProgressIndicator(color: mainColor))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: workerController.workerList.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workerController.workerList[index].JobTitle,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black38),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                workerController.workerList[index].Name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "${workerController.workerList[index].Salary} ₼",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          // const SizedBox(height: 8),
                          // Text(
                          //   "Balans ${detailController.payments[index].balance} ₼",
                          //   style:
                          //       TextStyle(fontSize: 12, color: Colors.black87),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black12),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            )),
    );
  }
}
