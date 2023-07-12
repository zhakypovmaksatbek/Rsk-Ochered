import 'package:bank_appointment_scheduler/theme/style/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/color_constants.dart';

mixin MyTheme {
  ThemeData get myTheme => ThemeData(
        colorScheme: ColorScheme.light(
            error: ColorConstants.errorColor,
            primary: ColorConstants.appBarBackgroundColor,
            background: ColorConstants.backgroundExpansionTile),
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            elevation: 0,
            titleTextStyle:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            iconTheme: IconThemeData(color: ColorConstants.white, size: 30),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent),
        checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStatePropertyAll(ColorConstants.textColor),
            fillColor:
                MaterialStatePropertyAll(ColorConstants.textButtonColor)),
        listTileTheme: ListTileThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          tileColor: ColorConstants.backgroundExpansionTile,
          iconColor: ColorConstants.appBarBackgroundColor,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorConstants.appBarBackgroundColor),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0, backgroundColor: ColorConstants.white),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          prefixIconColor: ColorConstants.textColor,
          suffixIconColor: ColorConstants.textColor,
          fillColor: ColorConstants.backgroundTextField,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide:
                  BorderSide(color: ColorConstants.backgroundTextField)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide:
                  BorderSide(color: ColorConstants.backgroundTextField)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide:
                  BorderSide(color: ColorConstants.backgroundTextField)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide:
                BorderSide(color: ColorConstants.backgroundTextField), //
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: CustomTextStyle.expansionTextStyle,
                labelStyle: CustomTextStyle.expansionTextStyle),
            textStyle: CustomTextStyle.expansionTextStyle,
            menuStyle: MenuStyle(
              
              backgroundColor: MaterialStatePropertyAll(
                  ColorConstants.backgroundExpansionTile),
            )),
        expansionTileTheme: ExpansionTileThemeData(
            childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            collapsedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: ColorConstants.backgroundExpansionTile,
            collapsedIconColor: ColorConstants.textColor,
            iconColor: ColorConstants.textColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(vertical: 14)),
                backgroundColor: const MaterialStatePropertyAll(
                    ColorConstants.backgroundButtonColor),
                textStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(
                    fontSize: 16,
                    color: ColorConstants.appBarBackgroundColor)))),
      );
}
