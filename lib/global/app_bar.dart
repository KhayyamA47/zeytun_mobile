// ignore_for_file: depend_on_referenced_packages, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/UI/test.dart';
import 'package:zeytun_app/global/project_color.dart';
int count=0;
AppBar projectAppBAr(BuildContext context,
    {search = true, main = true, title = ''}) {
  return AppBar(
    backgroundColor: mainColor,
    elevation: 0,
    leading: main
        ? null
        : IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
    title: GestureDetector(
      onTap: (){
        count++;
        if(count==7){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestPage()));

        }
      },
      child: Image.asset(
        'assets/images/logo.png',
        width: 120,
      ),
    ),
    centerTitle: true,
  );
}
