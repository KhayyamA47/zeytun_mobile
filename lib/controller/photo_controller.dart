// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoController extends GetxController {
  File? image1;

  /// *IMG
  var image1chech = false.obs;

  /// *IMG
  var imgName = ''.obs;
  String? imageName1;

  bool removeImage1() {
    image1 = null;
    image1chech.value = false;
    imageName1 = '';
    imgName.value = '';
    return true;
  }
  /// *IMG
  Future picktureImage1() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 50,
          maxHeight: 600,
          maxWidth: 900);
      if (image != null) {
        imageName1 = image.path.split('/').last;
        imgName.value = image.path.split('/').last.substring(0, 30);
        image1 = File(image.path);
        image1chech.value = true;
      } else {
        image1 = null;
        image1chech.value = false;
        imageName1 = null;
      }
    } on PlatformException catch (e) {
      print('Filed to image $e');
    }
  }

  ///  Backende Images gonderilmesi.
  Future sendPhotosKitchen(context) async {
    // showLoaderDialog(context);
    var data = [].obs;

    if (image1 != null) {
      var image =
          await dio.MultipartFile.fromFile(image1!.path, filename: imageName1);

      data.add(image);
    }

    if (data.length >= 1) {
      var formData = dio.FormData.fromMap({
        "photos": [data],
      });

      // PhotosSendDataSource().sendPhotos(formData).then((value) {
      //   if (value != null) {
      //     if (value) {
      //       Get.back();
      //       Get.toNamed('/adress');
      //     } else {
      //       Get.back();
      //       Get.defaultDialog(
      //           title: 'Xəta',
      //           middleText: 'Şəkillərin yüklənməsi zamanı xəta baş verdi.');
      //     }
      //   } else {
      //     Get.back();
      //     Get.defaultDialog(
      //         title: 'Xəta',
      //         middleText: 'Şəkillərin yüklənməsi zamanı xəta baş verdi.');
      //   }
      // })
    } else {
      Get.back();
      Get.defaultDialog(
          title: 'Xəta', middleText: 'Minimum 1 Şəkil yüklənməlisiniz.');
    }
  }
}
