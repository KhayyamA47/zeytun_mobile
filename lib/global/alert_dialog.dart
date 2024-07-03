// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

Future<void> showMyDialog(
  context, {
  required title,
  required subTitle,
  required buttonName,
  required buttonOnTap,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(subTitle),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(buttonName),
            onPressed: buttonOnTap,
          ),
        ],
      );
    },
  );
}
