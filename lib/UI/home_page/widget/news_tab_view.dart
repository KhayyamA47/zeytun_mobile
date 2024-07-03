// // ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
// import 'package:zeytun_app/global/button.dart';
// import 'package:zeytun_app/global/drop_down.dart';
// import 'package:zeytun_app/global/project_color.dart';
// import 'package:zeytun_app/global/text_field.dart';

// class NewsTabView extends StatelessWidget {
//   const NewsTabView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 16, right: 16),
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height,
//       color: const Color(0xFFf6f6f6),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             // const Text('Aptekləri seçin:'),
//             // const SizedBox(height: 10),
//             // dropDown(
//             //   context: context,
//             //   hintText: temaAndNewsController.hintText.value,
//             //   list: temaAndNewsController.allPharmacy,
//             //   // controller: controller
//             // ),
//             // const SizedBox(height: 20),
//             // const Text('Kategoria:'),
//             // const SizedBox(height: 10),
//             // dropDown(
//             //   context: context,
//             //   hintText: temaAndNewsController.hintText.value,
//             //   list: temaAndNewsController.allPharmacy,
//             //   // controller: controller
//             // ),
//             // const SizedBox(height: 20),
//             const Text('Başlıq:'),
//             const SizedBox(height: 10),
//             TextFieldWidget(
//                 isCollapsed: false,
//                 aboutPadding: true,
//                 borderBlack: true,
//                 contentPaddingBottom: 15,
//                 fieldController: temaAndNewsController.tema,
//                 maxLines: 1,
//                 hintText: 'Məsələn: Spirt',
//                 keyboardType: TextInputType.text,
//                 contentPadding: 10,
//                 textInputAction: TextInputAction.done,
//                 colorIn: const Color(0xFFFFFFFF),
//                 borderColor: const Color(0xFFeaeaea)),
//             const SizedBox(height: 20),
//             const Text('Mesaj:'),
//             const SizedBox(height: 10),
//             TextFieldWidget(
//                 isCollapsed: false,
//                 aboutPadding: true,
//                 borderBlack: false,
//                 contentPaddingBottom: 50,
//                 fieldController: temaAndNewsController.text,
//                 maxLines: 4,
//                 hintText: 'Boş qoya bilməzsiniz',
//                 keyboardType: TextInputType.text,
//                 contentPadding: 10,
//                 textInputAction: TextInputAction.done,
//                 colorIn: const Color(0xFFFFFFFF),
//                 borderColor: const Color(0xFFeaeaea)),
//             const SizedBox(height: 20),
//             const Text('Fayl yükləmək:'),
//             const SizedBox(height: 20),
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                   border: Border.all(color: const Color(0xFFddd9d9))),
//               child: IconButton(
//                 icon: const Icon(Icons.attach_file_outlined),
//                 onPressed: () {},
//               ),
//             ),
//             const SizedBox(height: 40),
//             Container(
//                 height: 51,
//                 child: PageButton(
//                   color: mainColor,
//                   title: "YARATMAQ",
//                   onTap: () {},
//                 )),
//             const SizedBox(height: 10),
//             Center(
//               child: TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     'İMTİNA',
//                     style: TextStyle(color: Color(0xFF86869a)),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
