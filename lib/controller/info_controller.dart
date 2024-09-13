// ignore_for_file: prefer_is_empty

import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/data/data_source/informatio_data_source.dart';
import 'package:zeytun_app/global/loader_dialog.dart';

class InfoController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var allBool = true.obs;
  var aksiyaBool = false.obs;
  var newBool = false.obs;
  var waringBool = false.obs;

  List allList = [].obs;
  List aksiyaList = [].obs;
  List newList = [].obs;
  List waringList = [].obs;
  var page = 0;
  var finish=false;
  void onInit() {
    getAllInformation(0, allList);
    allBool.value = true;
    aksiyaBool.value = false;
    newBool.value = false;
    waringBool.value = false;
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      page++;
      if (allBool.value) {
        getAllInformation(0, allList,page: page);
      } else if (aksiyaBool.value) {
        getAllInformation(1, aksiyaList,page: page);
      } else if (newBool.value) {
        getAllInformation(2, newList,page: page);
      } else if (waringBool.value) {
        getAllInformation(3, waringList,page: page);
      }
      //log("scroll end");
      log("page => $page");
    }
  }
  Future buttonAll() async {
    page = 0;
    finish=false;
    allBool.value = true;
    aksiyaBool.value = false;
    newBool.value = false;
    waringBool.value = false;
    if (allList.length == 0) {
      getAllInformation(0, allList,page: page);
      infoController.aksiyaList.clear();
      infoController.newList.clear();
      infoController.waringList.clear();
    }
  }

  Future buttonAksiyalar() async {
    page = 0;
    finish=false;
    allBool.value = false;
    aksiyaBool.value = true;
    newBool.value = false;
    waringBool.value = false;
    if (aksiyaList.length == 0) {
      getAllInformation(1, aksiyaList);
      infoController.aksiyaList.clear();
      infoController.newList.clear();
      infoController.waringList.clear();
    }
  }

  Future buttonNew() async {
    page = 0;
    finish=false;
    allBool.value = false;
    aksiyaBool.value = false;
    newBool.value = true;
    waringBool.value = false;
    if (newList.length == 0) {
      getAllInformation(2, newList);
      infoController.aksiyaList.clear();
      infoController.allList.clear();
      infoController.waringList.clear();
    }
  }

  Future buttonWaring() async {
    page = 0;
    finish=false;
    allBool.value = false;
    aksiyaBool.value = false;
    newBool.value = false;
    waringBool.value = true;
    if (waringList.length == 0) {
      getAllInformation(3, waringList);
      infoController.aksiyaList.clear();
      infoController.allList.clear();
      infoController.newList.clear();
    }
  }

  Future getAllInformation(id, list,{page=0}) async {
    log("id => $id");
    if (finish == true) {
      this.page--;
      return;
    }
    InformationDataSource().getInformation(id,page: page).then((value) {
      if (value != null) {
        if (value.data!.length == 0) {
          finish = true;
        }
        for (var i = 0; i < value.data!.length; i++) {
          list.add(value.data![i]);
        }
      } else {
        finish = true;
      }
    });
  }
}
