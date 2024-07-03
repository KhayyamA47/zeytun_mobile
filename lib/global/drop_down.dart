// ignore_for_file: prefer_const_constructors, prefer_is_empty, sort_child_properties_last, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';

Container dropDown({
  required context,
  required List list,
  required String hintText,
  Color dropDownIconColor = Colors.black,
  Color textColor = Colors.black,
}) {
  return Container(
    padding: EdgeInsets.only(left: 15, right: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: Color(0xFFe8e8e8),
        width: 2,
      ),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: Text(
          hintText,
          style: TextStyle(
              fontSize: 14, color: textColor, fontWeight: FontWeight.bold),
        ),
        iconSize: 36,
        icon: Icon(
          Icons.arrow_drop_down,
          color: dropDownIconColor,
        ),
        isExpanded: true,
        style: TextStyle(color: Colors.white),
        items: list.length != 0
            ? list
                .map((e) => DropdownMenuItem(
                      child: Text(
                        e.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      value: e.toString(),
                    ))
                .toList()
            : null,
        onChanged: (item) {
          appealController.changeHintText(item.toString());
        },
      ),
    ),
  );
}

// void changeFunction(item, hintText) {
//   print(item);
// }
