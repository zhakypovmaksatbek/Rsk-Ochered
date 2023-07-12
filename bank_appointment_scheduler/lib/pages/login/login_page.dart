// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/constants/image_icon_path.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/widget/language_selected_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/provider/register_provider.dart';
import 'package:bank_appointment_scheduler/widget/password_textform.dart';

import '../../theme/style/paddigs_and_decaration.dart';
import '../../widget/custom_textform.dart';
import '../../widget/buttons/remember_me.dart';

class LoginPage extends StatelessWidget with BackgroundDecoration {
  LoginPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, provider, child) => Container(
        decoration: decoration,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.language_outlined),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: LanguageSelectionMenu())
                  ];
                },
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: paddingMedium,
              child: SingleChildScrollView(
                child: Form(
                  key: provider.loginKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Image.asset(
                          ImageEnum.logo2.imagePath,
                          height: MediaQuery.of(context).size.height * 0.15,
                          color: ColorConstants.white,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextForm(
                            autofillHints: const [
                              AutofillHints.telephoneNumber
                            ],
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                            hintText: LocaleKeys.phone_number.tr(),
                            controller: provider.phoneNumController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.nomer_tel.tr();
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          PasswordTextForm(
                              autofillHints: const [AutofillHints.password],
                              iconObs: Icon(
                                provider.isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                              obscureText: provider.isObscure ? false : true,
                              onTap: () {
                                provider.changeObscure();
                              },
                              validator: provider.validatePassword,
                              textInputAction: TextInputAction.go,
                              hintText: LocaleKeys.password.tr(),
                              textInputType: TextInputType.visiblePassword,
                              controller: provider.passwordController),
                          const RememberMeWidget(),
                          TextButton(
                              onPressed: () {
                                NavigatorManager.instance
                                    .pushToPage(NavigateRoutes.forgotPassword);
                              },
                              child: Text(
                                LocaleKeys.forgot_password.tr(),
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        ColorConstants.textButtonColor,
                                    color: ColorConstants.textButtonColor),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {
                                  provider.login(context);
                                },
                                child: Text(
                                  LocaleKeys.login.tr(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          ColorConstants.appBarBackgroundColor),
                                )),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    NavigateRoutes.register.withParaf);
                              },
                              child: Text(
                                LocaleKeys.register.tr(),
                                style: TextStyle(color: ColorConstants.white),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
