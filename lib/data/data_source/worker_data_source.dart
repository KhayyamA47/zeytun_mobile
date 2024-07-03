// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zeytun_app/data/model/worker_model.dart';

class WorkerDataSource {
  Future<WorkerModel?> getWorkerList({uid}) async {
    try {
      String username = 'MobApp';
      String password = 'fE0{B@~dfD';
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      final dio = Dio()
        ..options = BaseOptions(
            baseUrl: 'http://85.132.107.206:6540/',
            headers: <String, String>{'authorization': basicAuth});

      var response = await dio
          .post('buxgalteriya/hs/salary/Mob_app', data: {"GUID": "$uid"});
      if (response.statusCode == 200) {
        return WorkerModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
