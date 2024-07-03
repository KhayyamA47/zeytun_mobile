// ignore_for_file: depend_on_referenced_packages, avoid_unnecessary_containers, prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/global/drawer.dart';

import '../../global/app_bar.dart';
import '../../global/float_action_button.dart';
import '../../global/project_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProjectDrower(),
        floatingActionButton: CircleAvatar(
            radius: 28,
            backgroundColor: mainColor,
            child: IconButton(
              onPressed: () {
                floatingAction(context);
                // homeController.getPharmacyList();
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
        appBar: projectAppBAr(context),
        body: Column(
          children: [
            SizedBox(height: 10),
            // Padding(
            //     padding: const EdgeInsets.only(
            //         top: 10.0, left: 16, right: 16, bottom: 10),
            //     child: TextFieldWidget(
            //         isCollapsed: false,
            //         aboutPadding: true,
            //         borderBlack: true,
            //         onChange: true,
            //         fieldController: homeController.search,
            //         contentPaddingBottom: 15,
            //         maxLines: 1,
            //         prefixIcon: const Icon(Icons.search),
            //         suffix: Icon(Icons.filter_alt, color: mainColor),
            //         hintText: 'Search',
            //         keyboardType: TextInputType.text,
            //         contentPadding: 10,
            //         textInputAction: TextInputAction.done,
            //         colorIn: const Color(0xFFe3e3e5))),
            Obx(
              () => Container(
                child: homeController.pharmacyList.length == 0
                    ? Center(child: CircularProgressIndicator(color: mainColor))
                    : homeController.searchText.value.length != 0
                        ? pharmacyList(homeController.searchList)
                        : pharmacyList(homeController.pharmacyList),
              ),
            ),
          ],
        ));
  }

  Expanded pharmacyList(list) {
    return Expanded(
      child: ListView.builder(
          controller: homeController.scrollController,
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  detailController.title.value = list[index].name.toString();
                  detailController.id.value = list[index].id;
                  Get.toNamed('/detail');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                list[index].name.toString().length < 20
                                    ? list[index].name
                                    : "${list[index].name.toString().substring(0, 20)}...",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(width: 15),
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Color(0xFF339c69),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Online',
                                    style: TextStyle(
                                      color: Color(0xFF339c69),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(
                            '${list[index].balance} ₼',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFfc1819),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${list[index].address}',
                      ),

                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text('VOEN: '),
                          SizedBox(width: 10),
                          Text('${list[index].voen}'),
                        ],
                      ),

                      /// index != list.lengt
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
    );
  }
}
