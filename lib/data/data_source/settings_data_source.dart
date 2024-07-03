import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';

class SettingsDataSource {
  Future<bool?> changePassword(oldPass, newPass) async {
    try {
      var response = await clientDio.get(
        "${NetworkPath.CHANGEPASSWORD.rawValue}?new-password=$newPass&old-password=$oldPass",
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
