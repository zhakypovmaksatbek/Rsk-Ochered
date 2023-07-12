// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.validator,
    this.autofillHints,
  }) : super(key: key);
  final String hintText;

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String? value) validator;
  final List<String>? autofillHints;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      controller: controller,
      cursorColor: ColorConstants.textColor,
      style: TextStyle(
          decorationColor: ColorConstants.textColor,
          color: ColorConstants.textColor),
      decoration: InputDecoration(
          errorStyle: TextStyle(
            color: ColorConstants.white,
          ),
          hintStyle: TextStyle(color: ColorConstants.textColor),
          hintText: hintText,
          border: InputBorder.none),
    );
  }
}
