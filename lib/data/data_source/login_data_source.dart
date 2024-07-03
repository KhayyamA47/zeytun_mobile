// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/login_model.dart';

class LoginDataSource {
  Future<LoginModel?> login(data) async {
    log("RRRRR");

    try {
      var response =
          await clientDio.post(NetworkPath.LOGIN.rawValue, data: data);
      log(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode == 200) {
        if (response.data["data"]['access_token'] != null) {
          return LoginModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
