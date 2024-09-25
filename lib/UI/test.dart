import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zeytun_app/data/data_source/pharmacy_data_source.dart';
import 'package:zeytun_app/services/user_service.dart';
import 'package:zeytun_app/util.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
                heroTag: "1",
                label: const Text("Get user"),
                onPressed: () async {
                  final user = await _userService.getUser();
                  toastMessage(user!.toString());
                }),
            SizedBox(height: 10),
            FloatingActionButton.extended(
                heroTag: "2",
                label: const Text("Get login key"),
                onPressed: () async {
                  var storage = GetStorage();
                  toastMessage("GET storage token : ${storage.read('login')}");
                  const storage2 = FlutterSecureStorage();
                  var token = await storage2.read(key: 'token');
                  toastMessage("Secure token : $token");
                }),
            SizedBox(height: 10),
            FloatingActionButton.extended(
                heroTag: "3",
                label: const Text("Atek list"),
                onPressed: () async {
                  PharmacyDataSource().getList(0, "").then((value) {
                    toastMessage(value.toString());
                  });
                }),
          ],
        ),
      ),
    );
  }
}
