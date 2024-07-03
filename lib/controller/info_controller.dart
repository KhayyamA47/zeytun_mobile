// ignore_for_file: prefer_is_empty

import 'package:get/get.dart';
import 'package:zeytun_app/data/data_source/informatio_data_source.dart';

class InfoController extends GetxController {
  var allBool = true.obs;
  var aksiyaBool = false.obs;
  var newBool = false.obs;
  var waringBool = false.obs;

  List allList = [].obs;
  List aksiyaList = [].obs;
  List newList = [].obs;
  List waringList = [].obs;

  Future buttonAll() async {
    allBool.value = true;
    aksiyaBool.value = false;
    newBool.value = false;
    waringBool.value = false;
    if (allList.length == 0) {
      getAllInformation(0, allList);
    }
  }

  Future buttonAksiyalar() async {
    allBool.value = false;
    aksiyaBool.value = true;
    newBool.value = false;
    waringBool.value = false;
    if (aksiyaList.length == 0) {
      getAllInformation(1, aksiyaList);
    }
  }

  Future buttonNew() async {
    allBool.value = false;
    aksiyaBool.value = false;
    newBool.value = true;
    waringBool.value = false;
    if (newList.length == 0) {
      getAllInformation(2, newList);
    }
  }

  Future buttonWaring() async {
    allBool.value = false;
    aksiyaBool.value = false;
    newBool.value = false;
    waringBool.value = true;
    if (waringList.length == 0) {
      getAllInformation(3, waringList);
    }
  }

  Future getAllInformation(id, list) async {
    list.clear();
    InformationDataSource().getInformation(id).then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.length; i++) {
          list.add(value.data![i]);
        }
      }
    });
  }
}
