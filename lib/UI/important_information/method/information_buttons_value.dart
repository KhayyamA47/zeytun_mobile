// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import '../../../global/project_color.dart';

Expanded informationValue(
    {required title, required bool isTrue, required onTap}) {
  return Expanded(
      child: InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: isTrue ? mainColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: mainColor)),
      child: Center(
          child: Text(
        title,
        style:
            TextStyle(fontSize: 14, color: isTrue ? Colors.white70 : mainColor),
      )),
    ),
  ));
}
