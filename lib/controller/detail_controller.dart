import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeytun_app/data/data_source/detail_data_source.dart';
import 'package:zeytun_app/global/alert_dialog.dart';

class DetailController extends GetxController {
  var title = ''.obs;
  var id = 0.obs;
  List totalDebt = [].obs;
  List debtProfit = [].obs;
  List debtMore = [].obs;
  List payments = [].obs;
  List contactList = [].obs;
  Future getTotalDebt() async {
    totalDebt.clear();
    DetailDataSource().getTotalDebt(id: id.value).then((value) {
      if (value != null) {
        totalDebt.add(value.data!.data);
      }
    });
  }

  Future getDebtProfit() async {
    debtProfit.clear();
    DetailDataSource().getDebtProfit(id: id.value).then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.data!.length; i++) {
          debtProfit.add(value.data!.data![i]);
        }
      }
    });
  }

  Future getDebtMore() async {
    debtMore.clear();
    DetailDataSource().getDebtMore(id: id.value).then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.data!.length; i++) {
          debtMore.add(value.data!.data![i]);
        }
      }
    });
  }

  Future getPayments(context) async {
    payments.clear();
    DetailDataSource().getPayments(id: id.value).then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.data!.length; i++) {
          payments.add(value.data!.data![i]);
        }
      } else {
        showMyDialog(context,
            title: "Xəta",
            subTitle: 'Xəta baş verdi',
            buttonName: "Aydındır",
            buttonOnTap: () => Get.back());
      }
    });
  }

  Future getContact(context) async {
    contactList.clear();
    DetailDataSource().getContact().then((value) {
      if (value != null) {
        for (var i = 0; i < value.data!.length; i++) {
          contactList.add(value.data![i]);
        }
      } else {
        showMyDialog(context,
            title: "Xəta",
            subTitle: 'Xəta baş verdi',
            buttonName: "Aydındır",
            buttonOnTap: () => Get.back());
      }
    });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

}
