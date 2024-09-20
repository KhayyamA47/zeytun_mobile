// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/information_model.dart';

class InformationDataSource {
  Future<InformationModel?> getInformation(category,{int page=0}) async {
    try {
      log("URL =>  ${clientDio.options.baseUrl+NetworkPath.INFO.rawValue}$category");
      var response =
          await clientDio.get("${NetworkPath.INFO.rawValue}$category?page=$page");
      if (response.statusCode == 200) {

        if (response.data['data'] != null) {
          return InformationModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
