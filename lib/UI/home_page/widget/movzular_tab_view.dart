// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/global/button.dart';
import 'package:zeytun_app/global/project_color.dart';
import 'package:zeytun_app/global/text_field.dart';
import 'package:zeytun_app/routes/app_routes.dart';

import '../../../controller/controller_listner.dart/storage_manegment.dart';

class MovzuTabView extends StatelessWidget {
  const MovzuTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFf6f6f6),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 10),
            // const Text('Aptekləri seçin:'),
            // const SizedBox(height: 10),
            // dropDown(
            //   context: context,
            //   hintText: temaAndNewsController.hintText.value,
            //   list: temaAndNewsController.allPharmacy,
            //   // controller: controller
            // ),
            // const SizedBox(height: 20),
            // const Text('Mesaj növü:'),
            // const SizedBox(height: 10),
            // dropDown(
            //   context: context,
            //   hintText: temaAndNewsController.hintText.value,
            //   list: temaAndNewsController.allPharmacy,
            //   // controller: controller
            // ),
            const SizedBox(height: 20),
            const Text('Mövzu adı:'),
            const SizedBox(height: 10),
            TextFieldWidget(
                isCollapsed: false,
                aboutPadding: true,
                borderBlack: true,
                contentPaddingBottom: 15,
                fieldController: appealController.tema,
                maxLines: 1,
                hintText: 'Məsələn: Spirt',
                keyboardType: TextInputType.text,
                contentPadding: 10,
                textInputAction: TextInputAction.done,
                colorIn: const Color(0xFFFFFFFF),
                borderColor: const Color(0xFFeaeaea)),
            const SizedBox(height: 20),
            const Text('Mesaj:'),
            const SizedBox(height: 10),
            TextFieldWidget(
                isCollapsed: false,
                aboutPadding: true,
                borderBlack: false,
                contentPaddingBottom: 50,
                fieldController: appealController.text,
                maxLines: 4,
                hintText: 'Boş qoya bilməzsiniz',
                keyboardType: TextInputType.text,
                contentPadding: 10,
                textInputAction: TextInputAction.done,
                colorIn: const Color(0xFFFFFFFF),
                borderColor: const Color(0xFFeaeaea)),
            const SizedBox(height: 20),
            const Text('Fayl yükləmək:'),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFddd9d9))),
                  child: IconButton(
                    icon: const Icon(Icons.attach_file_outlined),
                    onPressed: () {
                      photoController.picktureImage1();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Obx(() => Text(photoController.imgName.value)),
              ],
            ),
            const SizedBox(height: 40),
            Container(
                height: 51,
                child: PageButton(
                  color: mainColor,
                  title: "YARATMAQ",
                  onTap: () {
                    //create thread use tema,text and file , attach file
                    var thread =  chatController.createThread(
                        appealController.tema.text, appealController.text.text, photoController.imgName.value).then((val){
                          appealController.tema.clear();
                          appealController.text.clear();
                          photoController.removeImage1();
                          Get.back();
                          chatController.page=0;
                          chatController.getChatList(str:"Thread yaratmaq");
                          Get.toNamed(AppRoutes.CHAT);

                    });
                  },
                )),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'İMTİNA',
                    style: TextStyle(color: Color(0xFF86869a)),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future getData() async {
    try {
      var response = await clientDio.get('pharmacy/list');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
