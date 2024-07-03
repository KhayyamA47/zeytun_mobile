// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/information_model.dart';

class InformationDataSource {
  Future<InformationModel?> getInformation(category) async {
    try {
      var response =
          await clientDio.get("${NetworkPath.INFO.rawValue}$category");
      if (response.statusCode == 200) {

        log("Main response url ${NetworkPath.INFO.rawValue}$category");
        log("Main response header ${clientDio.options.baseUrl}");
        log("Main response header ${clientDio.options.headers}");
        log("Main response data ${response.data}");
        if (response.data['data'] != null) {
          return InformationModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
