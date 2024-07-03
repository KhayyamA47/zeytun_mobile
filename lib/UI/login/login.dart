// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zeytun_app/global/button.dart';
import 'package:zeytun_app/global/project_color.dart';
import 'package:zeytun_app/global/text_field.dart';

import '../../controller/controller_listner.dart/storage_manegment.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  "Daxil olmaq",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(height: 40),
                TextFieldWidget(
                  isCollapsed: false,
                  aboutPadding: true,
                  borderBlack: true,
                  fieldController: loginController.email,
                  contentPaddingBottom: 15,
                  maxLines: 1,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  contentPadding: 10,
                  textInputAction: TextInputAction.next,
                  colorIn: const Color.fromARGB(255, 234, 232, 232),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => TextFieldWidget(
                    isCollapsed: false,
                    aboutPadding: true,
                    borderBlack: true,
                    paswordType: loginController.passType.value,
                    suffix: IconButton(
                      onPressed: () {
                        loginController.passType.value =
                            !loginController.passType.value;
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Color.fromARGB(255, 126, 126, 125),
                      ),
                    ),
                    contentPaddingBottom: 15,
                    fieldController: loginController.password,
                    maxLines: 1,
                    hintText: 'Password',
                    keyboardType: TextInputType.text,
                    contentPadding: 10,
                    textInputAction: TextInputAction.done,
                    colorIn: const Color.fromARGB(255, 234, 232, 232),
                  ),
                ),
              ],
            ),
            Positioned.fill(
                bottom: 32,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 51,
                      child: PageButton(
                        color: mainColor,
                        title: "Daxil olmaq",
                        onTap: () {
                          loginController.login(context);
                        },
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
