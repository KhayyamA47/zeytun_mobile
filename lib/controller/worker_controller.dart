import 'package:get/get.dart';
import 'package:zeytun_app/data/data_source/worker_data_source.dart';

class WorkerController extends GetxController {
  var workerList = [].obs;

  Future getWorkerList(uid) async {
    workerList.clear();
    WorkerDataSource().getWorkerList(uid: uid).then((value) {
      if (value != null) {
        for (var i = 0; i < value.Employees!.length; i++) {
          workerList.add(value.Employees![i]);
        }
        Get.back();
        Get.toNamed('/worker');
      } else {
        Get.back();
        Get.defaultDialog(
            title: 'Məlumat tapılmadı',
            middleText: 'Əməkdaşlar barədə heç bir məlumat tapılmadı.');
      }
    });
  }
}
