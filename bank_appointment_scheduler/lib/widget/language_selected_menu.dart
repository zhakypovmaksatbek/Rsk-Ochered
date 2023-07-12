import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSelectionMenu extends StatelessWidget {
  const LanguageSelectionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            EasyLocalization.of(context)!.setLocale(const Locale('ky', 'KG'));

            // provider.changeLanguage(context, const Locale('ky', 'KG'));
            Navigator.of(context).pop();
          },
          child: const Text('Кыргызча'),
        ),
        TextButton(
          onPressed: () {
            //provider.changeLanguage(context, const Locale('en', 'EN'));
            EasyLocalization.of(context)!.setLocale(const Locale('en', 'EN'));

            Navigator.of(context).pop();
          },
          child: const Text('English'),
        ),
        TextButton(
          onPressed: () {
            EasyLocalization.of(context)!.setLocale(const Locale('ru', 'RU'));

            //provider.changeLanguage(context, const Locale('ru', 'RU'));
            Navigator.of(context).pop();
          },
          child: const Text('Русский'),
        ),
      ],
    );
  }
}
