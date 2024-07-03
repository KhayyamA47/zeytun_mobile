// ignore_for_file: must_be_immutable, sort_child_properties_last, depend_on_referenced_packages

import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  String title;
  Function()? onTap;
  Color? color;
  Color? buttonColor;
  PageButton({
    required this.onTap,
    required this.title,
    this.color,
    this.buttonColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: buttonColor ?? Colors.white),
          ),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? Colors.amber),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
