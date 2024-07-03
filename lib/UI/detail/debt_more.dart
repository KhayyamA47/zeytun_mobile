// ignore_for_file: prefer_is_empty, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/float_action_button.dart';
import '../../global/app_bar_detail.dart';
import '../../global/project_color.dart';

class DebtMoreView extends StatelessWidget {
  const DebtMoreView({super.key});

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
      appBar: detailAppBar(
        context,
      ),
      body: Obx(() => detailController.debtMore.length == 0
          ? Center(child: CircularProgressIndicator(color: mainColor))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: detailController.debtMore.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            detailController.debtMore[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            detailController.debtMore[index].balance,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
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
