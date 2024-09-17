import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/chat_model.dart';
import 'package:zeytun_app/data/model/data_model.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';

// import formdata
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:zeytun_app/data/model/reports_model.dart';

class ChatDataSource {
  // get Thread model list
  Future<List<Thread>> getChatList({int page = 0}) async {
    List<Thread> chatList = [];
    try {
      var response =
          await clientDio.get(NetworkPath.THREAD.rawValue + '?page=$page');
      // log("chat data source getChatList url ${NetworkPath.THREAD.rawValue}?page=$page");
      // log("chat data source getChatList baseUrl ${clientDio.options.baseUrl}");
      // log("chat data source getChatList header ${clientDio.options.headers}");
      // log("chat data source getChatList data ${response}");

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data["data"] != null &&
          response.data["data"].length > 0) {
        List<dynamic> data = response.data['data'];
        for (var i = 0; i < data.length; i++) {
          chatList.add(Thread.fromJson(data[i]));
        }
      }
      return chatList;
    } catch (e) {
      print(e);
    }
    return chatList;
  }

  Future getReposts({int page = 0}) async {
    try {
      var response =
          await clientDio.get('${NetworkPath.REPORTS.rawValue}?page=$page');
      if (response.statusCode == 200) {
        final data = ReportsModel.fromJson(response.data);
        return data;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // get message model list
  Future<List<MessageModel>> getMessageList({int? threadId = 0}) async {
    List<MessageModel> messageList = [];
    try {
      var response = await clientDio
          .get(NetworkPath.MESSAGESLIST.rawValue + '?thread_id=$threadId');
      // log("chat data source getMessageList url ${NetworkPath.MESSAGESLIST.rawValue}?thread_id=$threadId");
      // log("chat data source getMessageList baseUrl ${clientDio.options.baseUrl}");
      // log("chat data source getMessageList header ${clientDio.options.headers}");
      // log("chat data source getMessageList data ${response}");

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data["data"] != null &&
          response.data["data"].length > 0) {
        List<dynamic> data = response.data['data'];
        for (var i = 0; i < data.length; i++) {
          messageList.add(MessageModel.fromJson(data[i]));
        }
      }
      return messageList;
    } catch (e) {
      print(e);
    }
    return messageList;
  }

  // send message
  Future sendMessage({int threadId = 0, String message = ""}) async {
    try {
      dio.FormData data = await dio.FormData.fromMap({
        "thread_id": threadId,
        "recipient": 2,
        "body": message,
        if (photoController.image1 != null)
          "files[]": [
            await dio.MultipartFile.fromFile(photoController.image1!.path,
                filename: photoController.image1!.path.split('/').last,
                contentType: MediaType("image", "jpeg"))
          ]
      });
      dio.Options options = await dio.Options(method: "POST", headers: {
        "Authorization":
            "Bearer ${await FlutterSecureStorage().read(key: "token")}",
      });

      var response = await dio.Dio().request(
          clientDio.options.baseUrl + NetworkPath.SENDMESSAGE.rawValue,
          options: options,
          data: data);
      log("chat data source sendMessage start *******");
      log("chat data source sendMessage data ${response}");
log(response.statusCode.toString());
log(response.data.toString());
      if (response.statusCode == 200 && response.data != null) {
        return MessageModel.fromJson(response.data["data"]["message"]);
      }
    } catch (e) {
      print(e);
    }
  }

  Future createThread(
      {String thread_name = "", String body = "", files}) async {
    try {
      dio.FormData data = await dio.FormData.fromMap({
        "thread_name": thread_name,
        "body": body,
        if (photoController.image1 != null)
          "files[]": [
            await dio.MultipartFile.fromFile(photoController.image1!.path,
                filename: photoController.image1!.path.split('/').last,
                contentType: MediaType("image", "jpeg"))
          ]
      });
      dio.Options options = await dio.Options(method: "POST", headers: {
        "Authorization":
            "Bearer ${await FlutterSecureStorage().read(key: "token")}",
      });

      var response = await dio.Dio().request(
          clientDio.options.baseUrl + NetworkPath.CREATETHREAD.rawValue,
          options: options,
          data: data);

      log("chat data source createThread url ${NetworkPath.CREATETHREAD.rawValue}");
      log("chat data source createThread baseUrl ${clientDio.options.baseUrl}");
      log("chat data source createThread header ${clientDio.options.headers}");
      log("chat data source createThread data ${response}");
      if (response.statusCode == 200 && response.data != null) {
        return Thread.fromJson(response.data["data"]["thread"]);
      }
    } catch (e) {
      print("Error chat data source create thread => $e");
    }
  }
}
