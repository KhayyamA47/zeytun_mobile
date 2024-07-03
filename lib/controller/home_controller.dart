import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeytun_app/data/data_source/pharmacy_data_source.dart';
import 'package:zeytun_app/global/loader_dialog.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var pharmacyList = [].obs;
  var searchList = [].obs;
  var page = 0.obs;
  var searchText = ''.obs;
  Timer? _debounce;

  TextEditingController search = TextEditingController();

  Future<void> getPharmacyList() async {
    var storage = GetStorage();
    if (storage.read('login') == true) {
      pharmacyList.clear();
      PharmacyDataSource().getList(page.value, searchText.value).then((value) {
        if (value != null) {
          for (var i = 0; i < value.data!.length; i++) {
            pharmacyList.add(value.data![i]);
          }
        }
      });
    }
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      showLoaderDialog();
      page.value++;
      PharmacyDataSource().getList(page.value, searchText.value).then((value) {
        if (value != null) {
          for (var i = 0; i < value.data!.length; i++) {
            pharmacyList.add(value.data![i]);
          }
          Get.back();
        }
      });
    }
  }

  void searchItemDebounce() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchPharmacy();
    });
  }

  Future searchPharmacy() async {
    searchList.clear();
    PharmacyDataSource().getList(page, searchText.value).then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.length; i++) {
          searchList.add(value.data![i]);
        }
      }
    });
  }

  @override
  void onInit() {
    getPharmacyList();
    scrollController.addListener(_scrollListener);

    super.onInit();
  }
}
