import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  final Locale _currentLocale = const Locale('ky','KG');

  Locale get currentLocale => _currentLocale;

  void changeLanguage(BuildContext context, Locale locale) {
    EasyLocalization.of(context)!.setLocale(locale);
    notifyListeners();
  }
}
