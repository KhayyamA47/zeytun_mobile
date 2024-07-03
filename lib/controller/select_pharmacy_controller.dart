import 'package:get/get.dart';

enum SECTION { PAY, WORKER }

class SelectPharmacyController extends GetxController {
  var title = ''.obs;
  // section 1 işçilər, 2 Hesabatlar, 3 Ödənişlər.
  var sectionId = 0.obs;
}
