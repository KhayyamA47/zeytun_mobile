// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:zeytun_app/global/project_color.dart';

import '../UI/home_page/widget/movzular_tab_view.dart';

Future floatingAction(BuildContext context) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    useSafeArea: true,
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.98,
        builder: (BuildContext context, ScrollController scrollController) {
          return DefaultTabController(
            length: 1,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    indicatorColor: mainColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(color: mainColor),
                    tabs: [
                      newTab(text: 'MÜRACİƏT'),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      MovzuTabView(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Tab newTab({text}) {
  return Tab(
    child: Text(
      text,
      style: TextStyle(
          color: mainColor, fontSize: 16, fontWeight: FontWeight.w700),
    ),
  );
}
