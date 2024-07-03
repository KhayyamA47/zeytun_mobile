// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CompanentDetailMenuHome extends StatefulWidget {
  final String title;

  final Widget customWidget;

  const CompanentDetailMenuHome({
    required this.title,
    required this.customWidget,
  });

  @override
  _CompanentDetailMenuState createState() => _CompanentDetailMenuState();
}

class _CompanentDetailMenuState extends State<CompanentDetailMenuHome> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ), // Yüksekliği kontrol ediyoruz
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontFamily: 'TTHoves',
                            fontSize: 16,
                            color: Color(0xFF292929),
                            fontWeight: FontWeight.w400),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            isClicked ? widget.customWidget : const SizedBox()
          ],
        ),
      ),
    );
  }
}
