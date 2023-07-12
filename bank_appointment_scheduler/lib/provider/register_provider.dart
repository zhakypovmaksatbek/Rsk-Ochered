import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Product/slider_page_route.dart';
import '../constants/color_constants.dart';
import '../constants/text_constants.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';
import '../pages/general_page.dart';

class RegisterProvider extends ChangeNotifier {
  int currentPage = 1;
  final PageController pageController = PageController(initialPage: 1);
  void animateToPage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(
          milliseconds: 400,
        ),
        curve: Curves.easeInOut);
    notifyListeners();
  }

  bool showLoginpage = true;
  void togglePages() {
    showLoginpage = !showLoginpage;
    notifyListeners();
  }

  bool showCategoryPage = true;
  void togglePage() {
    showCategoryPage = !showCategoryPage;
    notifyListeners();
  }

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final surnameController = TextEditingController();
  final innController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumController = TextEditingController();
  final passwordController = TextEditingController();
  final regPasswordController = TextEditingController();
  final rpPasswordController = TextEditingController();

  bool isObscure = false;
  bool isObscureRP = false;
  void changeObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void changeObscureRP() {
    isObscureRP = !isObscureRP;
    notifyListeners();
  }

  //TextForm cantroll
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  String? validatePassword(String? value) {
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    );
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return TextConstants.writePassword;
    } else if (passNonNullValue.length < 6) {
      return LocaleKeys.password_must_6character.tr();
    } else if (!regex.hasMatch(passNonNullValue)) {
      return LocaleKeys.password_lowercase_uppercase_character.tr();
    }
    return null;
  }

  String? validateRepeatPassword(String? value, String? password) {
    final regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    );
    final passNonNullValue = value ?? '';
    if (value!.isEmpty) {
      return TextConstants.writePassword;
    } else if (passNonNullValue.length < 6) {
      return LocaleKeys.password_must_6character.tr();
    } else if (!regex.hasMatch(passNonNullValue)) {
      return LocaleKeys.password_lowercase_uppercase_character.tr();
    } else if (passNonNullValue != password) {
      return LocaleKeys.password_doest_much.tr();
    }
    return null;
  }

  //ChekBox Controll
  bool isChecked = false;
  void changeChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }

  // Backend Login girisi

  Future<void> login(BuildContext context) async {
    if (loginKey.currentState!.validate()) {
      try {
        showLoadingDialog(context);

        bool success = await fetchData();
        Navigator.of(context).pop();
        if (success) {
          Navigator.of(context).pushAndRemoveUntil(
            SlidePageRoute(
              page: const GeneralPage(),
            ),
            (route) => false,
          );
        } else {
          showErrorDialog(context, LocaleKeys.error.tr(),
              LocaleKeys.login_unsuccessful.tr(), LocaleKeys.try_again.tr());
        }
      } catch (e) {
        Navigator.of(context).pop();
        showErrorDialog(context, LocaleKeys.error.tr(),
            LocaleKeys.is_error.tr(), LocaleKeys.try_again.tr());
      }
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SpinKitFadingCircle(
          color: ColorConstants.white,
        );
      },
    );
  }

  void showErrorDialog(
      BuildContext context, String title, String message, String buttonText) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              )),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Text(buttonText),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool> fetchData() async {
    var url = 'https://petshackaton.ru/account/login/';
    var dio = Dio();

    var loginData = LoginModel(
      phoneNumber: phoneNumController.text,
      password: passwordController.text,
    );

    try {
      var response = await dio.post(
        url,
        data: loginData.toJson(),
      );

      if (response.statusCode == 200) {
        print('Кирүү ийгиликтүү');
        var responseData = response.data;
        ApiService.authToken = responseData['access'];

        print('Response body: ${response.data}');
        return true;
      } else {
        print('Кирүү ишке ашпады. Катанын коду : ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Ката: $e');
      throw Exception(LocaleKeys.login_unsuccessful.tr());
    }
  }

  var dio = Dio();

  Future<bool> register(
      RegisterModel registerModel, BuildContext context) async {
    try {
      showLoadingDialog(context);

      final response = await dio.post(
        'https://petshackaton.ru/account/register/',
        data: registerModel.toJson(),
      );
      Navigator.of(context).pop();

      // Eğer başarılı bir şekilde kayıt işlemi gerçekleştiyse
      if (response.statusCode == 201) {
        final data = response.data;
        showErrorDialog(
          context,
          LocaleKeys.successful.tr(),
          data.toString(),
          LocaleKeys.ok.tr(),
        );

        // Aktivasyon linkini mail olarak alabilir ve kullanıcıya gönderebilirsiniz
        return true;
      } else if (response.statusCode == 400) {
        showErrorDialog(context, LocaleKeys.error.tr(),
            "Bul maalymattar kattalgan", LocaleKeys.try_again.tr());
      } else {
        final data = response.data;

        print('Hata yanıtı: ${data.toString()}');
      }
    } catch (error) {
      Navigator.of(context).pop();

      print('Kayıt işlemi sırasında bir hata oluştu: $error');
    }

    return false;
  }
}
