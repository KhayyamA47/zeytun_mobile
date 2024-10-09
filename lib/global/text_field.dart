// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeytun_app/controller/controller_listner.dart/storage_manegment.dart';
import 'package:zeytun_app/controller/login_controller.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  TextEditingController fieldController;
  TextInputType? keyboardType;
  TextInputAction textInputAction;
  Widget? prefixIcon;
  Widget? suffix;
  Color colorIn;
  Color? borderColor;
  var onSaved;
  double contentPadding;
  double contentPaddingBottom;
  bool paswordType;
  bool credidCard;
  bool leftButton;
  bool monthCreditCard;
  bool isCollapsed;
  bool aboutPadding;
  bool borderBlack;
  bool onlyNumber;
  bool onChange;
  int maxLines;
  List<String>? autofillHints;

  TextFieldWidget(
      {Key? key,
      this.prefixIcon,
      this.paswordType = false,
      this.credidCard = false,
      this.monthCreditCard = false,
      this.contentPaddingBottom = 0,
      this.leftButton = false,
      this.aboutPadding = false,
      this.borderBlack = false,
      this.suffix,
      this.onSaved,
      this.onlyNumber = false,
      this.borderColor,
      this.autofillHints,
      this.onChange = false,
      required this.isCollapsed,
      required this.fieldController,
      required this.maxLines,
      required this.hintText,
      required this.keyboardType,
      required this.contentPadding,
      required this.textInputAction,
      required this.colorIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (s) {
        if (onChange) {
          homeController.searchText.value = s;
          homeController.searchItemDebounce();
        }
      },
      controller: fieldController,
      obscureText: paswordType,
      autofillHints: autofillHints,
      style: TextStyle(color: Colors.black),
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: onlyNumber
          ? <TextInputFormatter>[
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ]
          : null,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.only(
          left: contentPadding,
          bottom: contentPaddingBottom,
          top: contentPaddingBottom,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor == null ? colorIn : borderColor!, width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor == null ? colorIn : borderColor!,
                width: 1.0),
            borderRadius: BorderRadius.circular(8)),
        fillColor: colorIn,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 17,
          fontFamily: 'Popins',
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 121, 121, 121),
        ),
        prefixStyle: TextStyle(color: Colors.black),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
