import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 18.0);
}

checkVersion(BuildContext contct) async {
  const appleId = '1546060765';
  const playStoreId = 'az.zeythunpharmacy';
  await AppVersionUpdate.checkForUpdates(
      country: "AZ", appleId: appleId, playStoreId: playStoreId)
      .then((data) async {
    if (data.canUpdate!) {
      appUpdateDialog(data,contct);
    }
  });
}

appUpdateDialog(data,context) async {
  await AppVersionUpdate.showAlertUpdate(
      appVersionResult: data,
      context: context,
      backgroundColor: Colors.grey[200],
      title: 'Yeni versiya movcuddur.',
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),
      content: 'Tətbiqi yeniləyin!',
      contentTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
      updateButtonText: 'YENİLƏ',
      cancelButtonText: 'DAHA SONRA',
      mandatory: true);
}
