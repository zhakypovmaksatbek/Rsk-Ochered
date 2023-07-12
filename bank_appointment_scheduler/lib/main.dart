import 'package:bank_appointment_scheduler/Product/navigator/navigator_custom.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/pages/general_page.dart';
import 'package:bank_appointment_scheduler/provider/branches_provider.dart';
import 'package:bank_appointment_scheduler/provider/language_provider.dart';
import 'package:bank_appointment_scheduler/provider/profile_edit_provider.dart';
import 'package:bank_appointment_scheduler/provider/ticket_id.dart';
import 'package:bank_appointment_scheduler/theme/my_theme.dart';
import 'package:bank_appointment_scheduler/provider/register_provider.dart';
import 'package:bank_appointment_scheduler/provider/category_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generated/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
        ChangeNotifierProvider<ProfileEditProvider>(
          create: (_) => ProfileEditProvider(),
        ),
        ChangeNotifierProvider<BranchesNotifier>(
          create: (_) => BranchesNotifier(),
        ),
        ChangeNotifierProvider<TickedID>(
          create: (_) => TickedID(),
        ),
      ],
      child: EasyLocalization(
          supportedLocales: const [
            Locale('ru', 'RU'),
            Locale('ky', 'KG'),
            Locale('en', 'EN'),
          ],
          assetLoader: const CodegenLoader(),
          path:
              'assets/translations', // <-- change the path of the translation files
          fallbackLocale: const Locale('ky', 'KG'),
          child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget with MyTheme, NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, provider, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: provider.currentLocale,
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        title: 'RSK BANK',
        navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const GeneralPage(),
          );
        },
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
