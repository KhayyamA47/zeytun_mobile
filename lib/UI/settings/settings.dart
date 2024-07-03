import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/UI/settings/widget/custom_drop_down.dart';
import 'package:zeytun_app/global/app_bar_detail.dart';
import 'package:zeytun_app/global/button.dart';
import 'package:zeytun_app/global/float_action_button.dart';
import 'package:zeytun_app/global/loader_dialog.dart';
import 'package:zeytun_app/global/project_color.dart';
import 'package:zeytun_app/global/text_field.dart';

import '../../controller/controller_listner.dart/storage_manegment.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CircleAvatar(
            radius: 28,
            backgroundColor: mainColor,
            child: IconButton(
              onPressed: () {
                floatingAction(context);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
        appBar: detailAppBar(context, title: 'Ayarlar'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CompanentDetailMenuHome(
                  title: 'Şifrəni dəyiş',
                  customWidget: Container(
                      child: Column(
                    children: [
                      Obx(
                        () => TextFieldWidget(
                            isCollapsed: false,
                            aboutPadding: true,
                            borderBlack: true,
                            paswordType: settingsControlle.onePassType.value,
                            onChange: false,
                            fieldController: settingsControlle.initialPassword,
                            contentPaddingBottom: 15,
                            maxLines: 1,
                            suffix: IconButton(
                              onPressed: () {
                                settingsControlle.onePassType.value =
                                    !settingsControlle.onePassType.value;
                              },
                              icon: Icon(Icons.remove_red_eye_sharp,
                                  color: mainColor),
                            ),
                            hintText: 'Hazırki şifrəniz',
                            keyboardType: TextInputType.text,
                            contentPadding: 10,
                            textInputAction: TextInputAction.done,
                            colorIn: Color.fromARGB(255, 242, 242, 242)),
                      ),
                      SizedBox(height: 8),
                      Obx(
                        () => TextFieldWidget(
                            isCollapsed: false,
                            aboutPadding: true,
                            borderBlack: true,
                            onChange: false,
                            paswordType: settingsControlle.twoPassType.value,
                            fieldController: settingsControlle.newPassword,
                            contentPaddingBottom: 15,
                            maxLines: 1,
                            suffix: IconButton(
                              onPressed: () {
                                settingsControlle.twoPassType.value =
                                    !settingsControlle.twoPassType.value;
                              },
                              icon: Icon(Icons.remove_red_eye_sharp,
                                  color: mainColor),
                            ),
                            hintText: 'Yeni şifrə',
                            keyboardType: TextInputType.text,
                            contentPadding: 10,
                            textInputAction: TextInputAction.done,
                            colorIn: Color.fromARGB(255, 242, 242, 242)),
                      ),
                      SizedBox(height: 8),
                      Obx(
                        () => TextFieldWidget(
                            isCollapsed: false,
                            aboutPadding: true,
                            borderBlack: true,
                            onChange: false,
                            paswordType: settingsControlle.threePassType.value,
                            fieldController: settingsControlle.repaitPassword,
                            contentPaddingBottom: 15,
                            maxLines: 1,
                            suffix: IconButton(
                              onPressed: () {
                                settingsControlle.threePassType.value =
                                    !settingsControlle.threePassType.value;
                              },
                              icon: Icon(Icons.remove_red_eye_sharp,
                                  color: mainColor),
                            ),
                            hintText: 'Yeni şifrəni təkrar yazın',
                            keyboardType: TextInputType.text,
                            contentPadding: 10,
                            textInputAction: TextInputAction.done,
                            colorIn: Color.fromARGB(255, 242, 242, 242)),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: PageButton(
                          color: mainColor,
                          title: "Şifrəni dəyişin",
                          onTap: () {
                            showLoaderDialog();
                            settingsControlle.changePassword();
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  )),
                )
              ],
            ),
          ),
        ));
  }
}
