// ignore_for_file: sort_child_properties_last, prefer_is_empty, sized_box_for_whitespace, prefer_const_constructors, depend_on_referenced_packages, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/button.dart';
import 'package:zeytun_app/global/project_color.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Balans',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 5),
        Obx(() => detailController.totalDebt.length == 0
            ? Container(width: 40, child: LinearProgressIndicator())
            : Text(
                "${detailController.totalDebt[0].balance!} ₼",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              )),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Son 30 gün ərzində",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            circleComponent(Colors.green.shade400, 1, "MƏDAXIL"),
            circleComponent(Colors.red, 2, "MƏXARİC"),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 50,
          child: PageButton(
            onTap: () {
              detailController.getDebtMore();
              Get.toNamed('/debtMore');
            },
            title: "Daha ətraflı",
            color: mainColor,
          ),
        )
      ],
    );
  }

  Flexible circleComponent(color, value, bottomText) {
    return Flexible(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 80.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Obx(
                () => detailController.totalDebt.length == 0
                    ? CircularProgressIndicator(
                        color: color,
                      )
                    : Text(
                        "${value == 1 ? detailController.totalDebt[0].totalDebtPharmacy! : detailController.totalDebt[0].totalDebtWarehouse!} AZN",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: color),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
              radius: 70.0,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            bottomText,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
