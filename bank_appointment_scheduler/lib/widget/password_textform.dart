// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/provider/register_provider.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.onTap,
    required this.validator,
    required this.obscureText,
    required this.iconObs,
    this.autofillHints,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final void Function() onTap;
  final String? Function(String? value) validator;
  final bool obscureText;
  final Icon iconObs;
  final List<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
        builder: (context, provider, child) => TextFormField(
          autofillHints: autofillHints,
            keyboardType: textInputType,
            validator: validator,
           
            textInputAction: textInputAction,
            controller: controller,
            cursorColor: Colors.white,
            obscureText: obscureText,
            style: TextStyle(
                decorationColor: ColorConstants.textColor,
                color: ColorConstants.textColor),
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                color: Colors.white,
              ),
              
              hintStyle: TextStyle(color: ColorConstants.textColor),
              hintText: hintText,
              suffixIcon: IconButton(onPressed: onTap, icon: iconObs),
            )));
  }
}
