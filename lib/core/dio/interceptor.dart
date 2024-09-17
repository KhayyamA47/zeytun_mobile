// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/data/data_source/refresh_token.dart';

class DioInterceptor extends dio.Interceptor {
  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    if (token != null) {
      log("token :: $token");
      options.headers['Authorization'] = "Bearer $token";
    }
    handler.next(options);
  }

  @override
  void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
    log("err response => ${err.response!.statusCode.toString()}");
    log("err response => ${err.response}");
    log("err response dwwdww => ${err.requestOptions.uri}");
    if (err.response?.statusCode == 401) {
      try {
        final dio.RequestOptions requestOptions = err.requestOptions;
        final dio.RequestOptions cloneOptions = dio.RequestOptions(
          method: requestOptions.method,
          headers: requestOptions.headers,
          baseUrl: requestOptions.baseUrl,
          connectTimeout: requestOptions.connectTimeout,
          receiveTimeout: requestOptions.receiveTimeout,
          sendTimeout: requestOptions.sendTimeout,
          responseType: requestOptions.responseType,
          data: requestOptions.data,
          path: requestOptions.path,
          queryParameters: requestOptions.queryParameters,
        );

        const storage = FlutterSecureStorage();
        final value = await RefreshToken().refreshToken();
        if (value != null) {
          await storage.write(key: "token", value: value.data!.accessToken);
          cloneOptions.headers['Authorization'] =
              "Bearer ${value.data!.accessToken}";
        }

        final response = await clientDio.request(
          cloneOptions.path,
          options: dio.Options(
            method: cloneOptions.method,
            headers: cloneOptions.headers,
            receiveTimeout: cloneOptions.receiveTimeout,
            sendTimeout: cloneOptions.sendTimeout,
            responseType: cloneOptions.responseType,
          ),
        );

        handler.resolve(response);
      } catch (e) {
        Get.offAndToNamed('/');
        handler.next(err);
      }
    } else if (err.response?.statusCode == 404) {
      Get.back();
      Get.defaultDialog(
          title: 'Xəta', middleText: err.response?.data['data']['message']);
    } else {
      return;
    }
  }
}


// class DioInterceptor extends dio.Interceptor {
//   @override
//   void onRequest(
//     dio.RequestOptions options,
//     dio.RequestInterceptorHandler handler,
//   ) async {
//     final storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//     if (token != null) {
//       options.headers['Authorization'] = "Bearer $token";
//     }
//     handler.next(options);
//   }

//   @override
//   void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       try {
//         final dio.RequestOptions requestOptions = err.requestOptions;
//         final dio.RequestOptions cloneOptions = dio.RequestOptions(
//           method: requestOptions.method,
//           headers: requestOptions.headers,
//           baseUrl: requestOptions.baseUrl,
//           connectTimeout: requestOptions.connectTimeout,
//           receiveTimeout: requestOptions.receiveTimeout,
//           sendTimeout: requestOptions.sendTimeout,
//           responseType: requestOptions.responseType,
//           data: requestOptions.data,
//           path: requestOptions.path,
//           queryParameters: requestOptions.queryParameters,
//         );

//         final storage = FlutterSecureStorage();
//         final value = await RefreshToken().refreshToken();
//         if (value != null) {
//           await storage.write(key: "token", value: value.data!.accessToken);
//           cloneOptions.headers['Authorization'] =
//               "Bearer ${value.data!.accessToken}";
//         }

//         final response = await clientDio.request(
//           cloneOptions.path,
//           options: cloneOptions,
//         );

//         handler.resolve(response);
//       } catch (e) {
//         Get.offAndToNamed('/');
//         handler.next(err);
//       }
//     } else {
//       return;
//     }
//   }
// }





// class DioInterceptor extends dio.Interceptor {
//   @override
//   void onRequest(
//     dio.RequestOptions options,
//     dio.RequestInterceptorHandler handler,
//   ) async {
//     final storage = FlutterSecureStorage();
//     var token = await storage.read(key: 'token');
//     if (token != null) {
//       options.headers['Authorization'] = "Bearer $token";
//     }
//     handler.next(options);
//   }

//   @override
//   void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       await RefreshToken().refreshToken().then((value) async {
//         if (value != null) {
//           final storage = FlutterSecureStorage();
//           await storage.write(key: "token", value: value.data!.accessToken);

//           err.requestOptions.headers['Authorization'] =
//               "Bearer ${value.data!.accessToken}";

//           try {
//             dio.Response response = await err.requestOptions.data;
//             handler.resolve(response);
//           } catch (e) {
//             Get.offAndToNamed('/');
//             handler.next(err);
//           }
//         } else {
//           handler.next(err);
//         }
//       });
//     } else {
//       return;
//     }
//   }
// }
