// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_is_empty, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/app_bar.dart';
import 'package:zeytun_app/global/drawer.dart';
import 'package:zeytun_app/global/loader_dialog.dart';

class SelectPharmacyView extends StatelessWidget {
  const SelectPharmacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProjectDrower(),
        appBar: projectAppBAr(
          context,
          search: false,
          main: false,
          title: 'Bildirişlər',
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Obx(() => Text(
                      selectPharmacyController.title.value,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    )),
                SizedBox(height: 10),
                ListView.builder(
                    controller: homeController.scrollController,
                    itemCount: homeController.pharmacyList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            detailController.title.value = homeController
                                .pharmacyList[index].name
                                .toString();
                            detailController.id.value =
                                homeController.pharmacyList[index].id;
                            if (selectPharmacyController.sectionId.value == 1) {
                              showLoaderDialog();
                              workerController.getWorkerList(
                                  homeController.pharmacyList[index].code);
                            } else if (selectPharmacyController
                                    .sectionId.value ==
                                2) {
                              detailController.getTotalDebt();
                              detailController.getDebtProfit();
                              Get.toNamed("/hesabatDetail");
                            } else if (selectPharmacyController
                                    .sectionId.value ==
                                3) {
                              detailController.getPayments(context);
                              Get.toNamed("/payments");
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 8, bottom: 8),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/zeytun/ic_pharmacy.png',
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          homeController
                                                      .pharmacyList[index].name
                                                      .toString()
                                                      .length <
                                                  20
                                              ? homeController
                                                  .pharmacyList[index].name
                                              : "${homeController.pharmacyList[index].name.toString().substring(0, 20)}...",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(width: 15),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width: double.infinity,
                                  height: 1,
                                  color: Color(0xFFd1d1d2),
                                )
                              ],
                            ),
                          ),
                        )),
              ],
            ),
          ),
        ));
  }
}
