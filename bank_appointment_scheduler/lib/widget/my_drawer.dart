import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    super.key,
  });

  final Map<String, dynamic> drawMenuTask = {
    // '': const SizedBox(),
    'Выход': const Icon(Icons.logout_rounded),
    'Новости': const Icon(Icons.newspaper_outlined),
    'Курсы валют': const Icon(Icons.monetization_on_outlined),
    'Банкоматы и офисы': const Icon(Icons.account_balance_outlined),
    'О приложении': const Icon(Icons.info_outline_rounded),
    'Инструкция': const Icon(Icons.perm_device_information_outlined)
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      backgroundColor: ColorConstants.appBarBackgroundColor,
      child: ListView.builder(
        itemCount: drawMenuTask.length,
        itemBuilder: (context, index) {
          final key = drawMenuTask.keys.toList()[index];
          final icon = drawMenuTask[key];
          return ListTile(
            tileColor: Colors.transparent,
            onTap: () {},
            title: Text(
              key,
              style: TextStyle(color: ColorConstants.white),
            ),
            leading: icon,
            iconColor: ColorConstants.white,
          );
        },
      ),
    );
  }
}
