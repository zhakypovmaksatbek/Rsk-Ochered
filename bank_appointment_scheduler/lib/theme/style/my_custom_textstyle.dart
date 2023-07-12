import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle get expansionTextStyle => const TextStyle(
        color: ColorConstants.appBarBackgroundColor,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get buttonTextStyle => const TextStyle(
      color: ColorConstants.appBarBackgroundColor,
      fontWeight: FontWeight.w400,
      fontSize: 18);
  static TextStyle get whiteButtonTextStyle => TextStyle(
        color: ColorConstants.white,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get labelTextStyle => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: ColorConstants.appBarBackgroundColor,
      );
  static TextStyle get underLineTextStyle => TextStyle(
      fontSize: 12,
      decoration: TextDecoration.underline,
      decorationColor: ColorConstants.white,
      color: ColorConstants.white);
}
