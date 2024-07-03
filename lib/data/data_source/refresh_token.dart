// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/refresh_token_model.dart';

class RefreshToken {
  Future<RefreshTokenModel?> refreshToken() async {
    try {
      var response = await clientDio.post(NetworkPath.REFRESHTOKEN.rawValue);
      if (response.statusCode == 200) {
        if (response.data['data']["access_token"] != null) {
          return RefreshTokenModel.fromJson(response.data);
        }
      }
    } catch (e) {}
  }
}
