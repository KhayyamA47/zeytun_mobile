import 'package:get/get.dart';
import 'package:zeytun_app/controller/home_controller.dart';
import 'package:zeytun_app/controller/info_controller.dart';
import 'package:zeytun_app/controller/login_controller.dart';
import 'package:zeytun_app/controller/notification_controller.dart';
import 'package:zeytun_app/controller/photo_controller.dart';
import 'package:zeytun_app/controller/select_pharmacy_controller.dart';
import 'package:zeytun_app/controller/settings_controller.dart';
import 'package:zeytun_app/controller/tema_and_news_controller.dart';
import 'package:zeytun_app/controller/worker_controller.dart';

import '../controller/detail_controller.dart';
import '../controller/unregistered_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AppealController>(() => AppealController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut<InfoController>(() => InfoController());
    Get.lazyPut<SettingsControlle>(() => SettingsControlle());
    Get.lazyPut<UnregisteredController>(() => UnregisteredController());
    Get.lazyPut<SelectPharmacyController>(() => SelectPharmacyController());
    Get.lazyPut<PhotoController>(() => PhotoController());
    Get.lazyPut<WorkerController>(() => WorkerController());
  }
}
//add new HomeBinding