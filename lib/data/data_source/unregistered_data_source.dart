// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/unregistered_model.dart';

class UnregisteredDataSource {
  Future<UnregisteredModel?> getUnregistered(page) async {
    try {
      var response = await clientDio
          .get("${NetworkPath.UNREGISTERED.rawValue}?page=$page");
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return UnregisteredModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
