import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/pages/login/register_page.dart';
import 'package:bank_appointment_scheduler/theme/style/my_custom_textstyle.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/image_icon_path.dart';
import '../../widget/cards/info_card_with_image.dart';

class ForgotPassword extends StatelessWidget with BackgroundDecoration {
  const ForgotPassword({super.key});

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
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: LocaleKeys.email.tr()),
                  ),
                  const CustomSizedBox(),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              horizontalPaddingMedium)),
                      onPressed: () {
                        NavigatorManager.instance
                            .pushToPage(NavigateRoutes.newPassword);
                      },
                      child: Text(LocaleKeys.send.tr()))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
