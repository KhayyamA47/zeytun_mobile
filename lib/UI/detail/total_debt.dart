// ignore_for_file: unnecessary_string_interpolations, sort_child_properties_last, sized_box_for_whitespace, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/UI/detail/widget/top_section.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/app_bar_detail.dart';
import 'package:zeytun_app/global/float_action_button.dart';

import '../../global/project_color.dart';

class TotalDebtView extends StatelessWidget {
  const TotalDebtView({super.key});

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
          const SizedBox(width: 10),
          CircleAvatar(
              radius: 28,
              backgroundColor: mainColor,
              child: IconButton(
                onPressed: () {
                  //chat screenini bura elave etmek lazimdi
                },
                icon: const Icon(
                  Icons.chat,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopSection(),
              const SizedBox(height: 40),
              Obx(
                () => detailController.debtProfit.length == 0
                    ? Center(child: CircularProgressIndicator(color: mainColor))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: detailController.debtProfit.length,
                        itemBuilder: (context, index) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          size: 20,
                                          color: Colors.black38,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          detailController
                                              .debtProfit[index].date,
                                          style: const TextStyle(
                                              color: Colors.black38,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "${detailController.debtProfit[index].balance} ${detailController.debtProfit[index].currency}",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 4),
                                detailController.debtProfit[index].type == '0'
                                    ? Text(
                                        "+${detailController.debtProfit[index].amount} ${detailController.debtProfit[index].currency}",
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      )
                                    : Text(
                                        "${detailController.debtProfit[index].amount} ${detailController.debtProfit[index].currency}",
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.black12,
                                ),
                                const SizedBox(height: 10),
                              ]);
                        }),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
