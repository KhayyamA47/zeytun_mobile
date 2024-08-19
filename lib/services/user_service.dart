import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zeytun_app/data/model/pharmacy_list_model.dart';
// create a new class called UserService using PharmacyListData as a base class
class UserService{
  static final UserService _instance = UserService._internal();
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final String _userKey = 'pharmacy';

  factory UserService() {
    return _instance;
  }
  UserService._internal();

  Future<void> saveUser(PharmacyListModelData user) async {
    String userJson = jsonEncode(user.toJson());
    log("userJson => $userJson");
    await _storage.write(key: _userKey, value: userJson);
  }

  Future<PharmacyListModelData?> getUser() async {
    String? userJson = await _storage.read(key: _userKey);
    log("userJson => $userJson");
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return PharmacyListModelData.fromJson(userMap);
    }
    return null;
  }

  Future<void> deleteUser() async {
    await _storage.delete(key: _userKey);
  }}