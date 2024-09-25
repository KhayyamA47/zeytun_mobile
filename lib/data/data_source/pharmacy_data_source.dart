// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'dart:developer';

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';
import 'package:zeytun_app/util.dart';

class PharmacyDataSource {
  Future<PharmacyListModel?> getList(page, text) async {
    log("https://appzeytunpharm.az/api/${NetworkPath.PHARMACY.rawValue}?page=$page&search=$text");
    try {
      var response = await clientDio
          .get("${NetworkPath.PHARMACY.rawValue}?page=$page&search=$text");
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return PharmacyListModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
