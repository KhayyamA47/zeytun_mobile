// // ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
// import 'package:zeytun_app/global/app_bar.dart';
// import 'package:zeytun_app/global/drawer.dart';
// import 'package:zeytun_app/global/float_action_button.dart';
// import '../../global/project_color.dart';
//
// class PharmacyView extends StatelessWidget {
//   const PharmacyView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: ProjectDrower(),
//         floatingActionButton: CircleAvatar(
//             radius: 28,
//             backgroundColor: mainColor,
//             child: IconButton(
//               onPressed: () {
//                 floatingAction(context);
//               },
//               icon: const Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ),
//             )),
//         appBar: projectAppBAr(
//           context,
//           search: false,
//           main: false,
//           title: 'Daxil olmamaış apteklər',
//         ),
//         body: ListView.builder(
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return Container(
//                 padding: const EdgeInsets.all(8),
//                 margin: const EdgeInsets.all(8),
//                 width: double.infinity,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.campaign, color: mainColor),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     'May kompaniyası',
//                                     style: TextStyle(
//                                         color: Color.fromARGB(255, 81, 81, 81),
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 15),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             'Akademik Həsən Əliyev küçəsi/Akademik Lətif İmanov küçəsi Akademik Həsən Əliyev küçəsi/Akademik Lətif İmanov küçəsi Akademik Həsən Əliyev küçəsi/Akademik Lətif İmanov küçəsi ',
//                             maxLines: 3,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 149, 148, 148),
//                                 fontSize: 13),
//                           ),
//
//                           const SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Text(
//                                 'Depo: ',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 149, 148, 148),
//                                     fontSize: 13),
//                               ),
//                               SizedBox(width: 10),
//                               Icon(
//                                 Icons.calendar_month,
//                                 color: Color.fromARGB(255, 149, 148, 148),
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 '2024-05-02 09:49',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 149, 148, 148),
//                                     fontSize: 13),
//                               ),
//                             ],
//                           ),
//
//                           /// index != list.lengt
//                           Container(
//                             margin: EdgeInsets.only(top: 20),
//                             width: double.infinity,
//                             height: 1,
//                             color: Color(0xFFd1d1d2),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }));
//   }
// }
