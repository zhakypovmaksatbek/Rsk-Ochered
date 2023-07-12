import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

mixin BackgroundDecoration {
  BoxDecoration get decoration => const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.topRight,
          tileMode: TileMode.mirror,
          stops: [-2, 0.5],
          colors: [Color(0xff0092FC), Color(0xff0B5FA8)]));

  BoxDecoration get containerDecoration => BoxDecoration(
      color: ColorConstants.backgroundExpansionTile,
      borderRadius: BorderRadius.circular(12));

  BoxDecoration get borderContainerDecoration => BoxDecoration(
      border: Border.all(width: 1, color: ColorConstants.grey),
      color: ColorConstants.backgroundExpansionTile,
      borderRadius: BorderRadius.circular(22));

  BoxDecoration get linearDecoration => BoxDecoration(
      border: const GradientBoxBorder(
          width: 2,
          gradient: LinearGradient(colors: [
            Color(0xffE9A218),
            Color(0xffF4CD00),
          ])),
      borderRadius: BorderRadius.circular(12),
      gradient: const LinearGradient(
          colors: [
            Color(0xffFFF8DF),
            Color(0xffF4CD00),
            // Color(0xffE9A218),
            Color(0xffF4CD00),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp));
  BoxDecoration get linearDecoration2 => BoxDecoration(
      border: Border.all(color: const Color(0xffE14927), width: 2),
      borderRadius: BorderRadius.circular(12),
      gradient: const LinearGradient(
          colors: [
            Color(0xffFFF8DF),
            Color(0xffE14927),
            Color.fromARGB(255, 201, 12, 12),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp));

//--> Project Paddings

  EdgeInsets get horizontalPaddingNormal =>
      const EdgeInsets.symmetric(horizontal: 12);

  EdgeInsets get horizontalPaddingMedium =>
      const EdgeInsets.symmetric(horizontal: 24);
  EdgeInsets get paddingNormal => const EdgeInsets.all(12);
  EdgeInsets get paddingMedium => const EdgeInsets.all(18);
  EdgeInsets get horizontalPaddingHigh =>
      const EdgeInsets.symmetric(horizontal: 28);
  EdgeInsets get cardPadding => const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 24,
      );

  EdgeInsets get outlinePadding => const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      );
}
