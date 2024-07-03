import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/app_bar_detail.dart';
import 'package:zeytun_app/global/float_action_button.dart';

import '../../global/project_color.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
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
        ],
      ),
      appBar: detailAppBar(
        context,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                pharmasyDetailCompanent(
                  img: 'iconReports',
                  text: "Hesabat",
                  onTap: () {
                    detailController.getTotalDebt();
                    detailController.getDebtProfit();
                    Get.toNamed("/hesabatDetail");
                  },
                ),
                const SizedBox(width: 10),
                pharmasyDetailCompanent(
                  img: 'iconInfo',
                  text: "Vacib məlumatlar",
                  onTap: () {
                    infoController.buttonAll();
                    Get.toNamed("/info");
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                pharmasyDetailCompanent(
                  img: 'iconPayments',
                  text: "Ödənişlər",
                  onTap: () {
                    detailController.getPayments(context);
                    Get.toNamed("/payments");
                  },
                ),
                const SizedBox(width: 10),
                pharmasyDetailCompanent(
                  img: 'iconContacts',
                  text: "Əlaqələr",
                  onTap: () {
                    detailController.getContact(context);
                    Get.toNamed("/contact");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Expanded pharmasyDetailCompanent({
  var img,
  String text = '',
  void Function()? onTap,
}) {
  return Expanded(
      child: InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 18, bottom: 18),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Column(
        children: [
          Image.asset(
            'assets/zeytun/$img.png',
            width: 45,
          ),
          const SizedBox(height: 10),
          Text(text),
        ],
      ),
    ),
  ));
}
