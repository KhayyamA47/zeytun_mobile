import 'package:get/get.dart';
import 'package:zeytun_app/services/user_service.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();
  var user = Rxn<PharmacyListModelData>();

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  Future<void> _loadUser() async {
    user.value = await _userService.getUser();
  }

  Future<void> saveUser(PharmacyListModelData user) async {
    await _userService.saveUser(user);
    this.user.value = user;
  }

  Future<void> deleteUser() async {
    await _userService.deleteUser();
    user.value = null;
  }
}