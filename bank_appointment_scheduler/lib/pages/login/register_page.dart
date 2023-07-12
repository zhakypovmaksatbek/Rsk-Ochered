// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:bank_appointment_scheduler/widget/password_textform.dart';
import 'package:bank_appointment_scheduler/widget/buttons/remember_me.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../model/register_model.dart';
import '../../provider/register_provider.dart';
import '../../widget/custom_textform.dart';

class RegisterPage extends StatelessWidget with BackgroundDecoration {
  const RegisterPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final String logo = 'assets/images/rsk_logo2.png';
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, provider, child) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topRight,
                tileMode: TileMode.mirror,
                stops: [-2, 0.5],
                colors: [Color(0xff0092FC), Color(0xff0B5FA8)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: paddingMedium,
                child: Form(
                  key: provider.registerKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        logo,
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.white,
                      ),
                      const CustomSizedBox(),
                      CustomTextForm(
                        autofillHints: const [AutofillHints.givenName],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.please_write.tr();
                          } else if (value.length < 5) {
                            return LocaleKeys.pls_last_name.tr();
                          } else {
                            return null;
                          }
                        },
                        hintText: LocaleKeys.last_name.tr(),
                        controller: provider.lastNameController,
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const CustomSizedBox(),
                      CustomTextForm(
                        autofillHints: const [AutofillHints.name],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.please_write.tr();
                          } else if (value.length < 5) {
                            return LocaleKeys.pls_name;
                          } else {
                            return null;
                          }
                        },
                        hintText: LocaleKeys.name.tr(),
                        controller: provider.nameController,
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const CustomSizedBox(),
                      CustomTextForm(
                        autofillHints: const [AutofillHints.givenName],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.please_write.tr();
                          } else if (value.length < 5) {
                            return LocaleKeys.pls_surname.tr();
                          } else {
                            return null;
                          }
                        },
                        hintText: "surname".tr(),
                        controller: provider.surnameController,
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const CustomSizedBox(),
                      CustomTextForm(
                        autofillHints: const [AutofillHints.givenName],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.please_write.tr();
                          } else if (value.length < 5) {
                            return LocaleKeys.pls_surname.tr();
                          } else {
                            return null;
                          }
                        },
                        hintText: LocaleKeys.email.tr(),
                        controller: provider.emailController,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const CustomSizedBox(),
                      CustomTextForm(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.inn.tr();
                          } else if (value.length < 5) {
                            return LocaleKeys.inn_tuura.tr();
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        hintText: "inn".tr(),
                        controller: provider.innController,
                        textInputType: TextInputType.number,
                      ),
                      const CustomSizedBox(),
                      CustomTextForm(
                        autofillHints: const [AutofillHints.telephoneNumber],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return LocaleKeys.phone_number.tr();
                          } else if (value.length < 10) {
                            return LocaleKeys.nomer_tel.tr();
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.phone,
                        hintText: "phone_number".tr(),
                        controller: provider.phoneNumController,
                      ),
                      const CustomSizedBox(),
                      PasswordTextForm(
                        autofillHints: const [AutofillHints.password],
                        iconObs: Icon(
                          provider.isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        obscureText: provider.isObscure ? false : true,
                        textInputAction: TextInputAction.next,
                        hintText: "password".tr(),
                        textInputType: TextInputType.visiblePassword,
                        controller: provider.regPasswordController,
                        onTap: () {
                          provider.changeObscure();
                        },
                        validator: provider.validatePassword,
                      ),
                      const CustomSizedBox(),
                      PasswordTextForm(
                        autofillHints: const [AutofillHints.password],
                        iconObs: Icon(
                          provider.isObscureRP
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        obscureText: provider.isObscureRP ? false : true,
                        textInputAction: TextInputAction.go,
                        hintText: "repeat_password".tr(),
                        textInputType: TextInputType.visiblePassword,
                        controller: provider.rpPasswordController,
                        onTap: () {
                          provider.changeObscureRP();
                        },
                        validator: (value) {
                          return provider.validateRepeatPassword(
                              value, provider.regPasswordController.text);
                        },
                      ),
                      const RememberMeWidget(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            final registerModel = RegisterModel(
                                name: provider.nameController.text,
                                lastName: provider.lastNameController.text,
                                otchestvo: provider.surnameController.text,
                                email: provider.emailController.text,
                                phoneNumber: provider.phoneNumController.text,
                                password: provider.regPasswordController.text,
                                password2: provider.rpPasswordController.text,
                                pin: provider.innController.text);

                            final success =
                                await provider.register(registerModel, context);

                            if (success) {
                              print(
                                  'Kayıt işlemi başarılı. Aktivasyon linki gönderildi.');
                            } else {}
                          },
                          child: Text(
                            "register".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.appBarBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'login'.tr(),
                            style: TextStyle(color: ColorConstants.white),
                          )),
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

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
