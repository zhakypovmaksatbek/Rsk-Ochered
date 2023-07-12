import 'package:bank_appointment_scheduler/pages/login/register_page.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:bank_appointment_scheduler/widget/password_textform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/image_icon_path.dart';
import '../../generated/locale_keys.g.dart';
import '../../theme/style/my_custom_textstyle.dart';
import '../../widget/cards/info_card_with_image.dart';

class NewPassword extends StatelessWidget with BackgroundDecoration {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Scaffold(
        appBar: AppBar(
           title: Image.asset(
                ImageEnum.applogo.imagePath,
                height: 30,
              ),
        ),
        body: ListView(
          children: [
            const InfoCardWidgetWithImage(),
            Padding(
              padding: horizontalPaddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.edit_password.tr(),
                    style: CustomTextStyle.whiteButtonTextStyle
                        .copyWith(fontSize: 18),
                  ),
                  const CustomSizedBox(),
                  Text(
                    'Введите e-mail адрес, для изменения пароля',
                    style: CustomTextStyle.whiteButtonTextStyle
                        .copyWith(color: ColorConstants.grey, fontSize: 10),
                  ),
                  PasswordTextForm(
                    hintText: 'Новый пароль',
                    controller: TextEditingController(),
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.route,
                    onTap: () {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.password.tr();
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    iconObs: const Icon(Icons.visibility),
                  ),
                  const CustomSizedBox(),
                  PasswordTextForm(
                    hintText: LocaleKeys.repeat_password.tr(),
                    controller: TextEditingController(),
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.route,
                    onTap: () {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.password.tr();
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    iconObs: const Icon(Icons.visibility),
                  ),
                  const CustomSizedBox(),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              horizontalPaddingMedium)),
                      onPressed: () {},
                      child: Text(LocaleKeys.send.tr())),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
