import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/image_icon_path.dart';
import '../../pages/login/register_page.dart';
import '../../theme/style/my_custom_textstyle.dart';

class InfoPhoneNumberCard extends StatelessWidget {
  const InfoPhoneNumberCard({
    super.key,
    required this.paddingMedium,
  });

  final EdgeInsets paddingMedium;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.appBarBackgroundColor,
      child: Padding(
        padding: paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Центральный офис:',
              style: CustomTextStyle.expansionTextStyle
                  .copyWith(color: ColorConstants.backgroundButtonColor),
            ),
            Text(
              'г. Бишкек ул. Московская 80/1',
              style: CustomTextStyle.whiteButtonTextStyle,
            ),
            Text(
              'Факс: +996 (312) 68-04-06',
              style: CustomTextStyle.whiteButtonTextStyle,
            ),
            Text(
              'Email:info@rsk.kg',
              style: CustomTextStyle.whiteButtonTextStyle,
            ),
            const CustomSizedBox(),
            Text(
              '«Инструкция по книге жалоб и предложений от клиентов Банка»',
              style: CustomTextStyle.expansionTextStyle
                  .copyWith(color: ColorConstants.backgroundButtonColor),
            ),
            const CustomSizedBox(),
            Text(
              'Контакт-Центр 24/7:',
              style: CustomTextStyle.expansionTextStyle
                  .copyWith(color: ColorConstants.backgroundButtonColor),
            ),
            Text(
              '(0312/0552/0706/0775) 911 111',
              style: CustomTextStyle.whiteButtonTextStyle,
            ),
            const CustomSizedBox(),
            Text(
              'Телефон доверия',
              style: CustomTextStyle.expansionTextStyle
                  .copyWith(color: ColorConstants.backgroundButtonColor),
            ),
            Text(
              '(0312/0552/0706/0775) 911 111',
              style: CustomTextStyle.whiteButtonTextStyle,
            ),
            const CustomSizedBox(),
            Text(
              'WhatsApp',
              style: CustomTextStyle.expansionTextStyle
                  .copyWith(color: ColorConstants.backgroundButtonColor),
            ),
            Text(
              '+996 706 911 111',
              style: CustomTextStyle.whiteButtonTextStyle,
            ),
            const CustomSizedBox(),
            Text(
              'Лицензия НБКР №033,\nот 22 июня 2017 года',
              style: CustomTextStyle.whiteButtonTextStyle
                  .copyWith(color: ColorConstants.textColor2),
            ),
            const CustomSizedBox(),
            SizedBox(
              child: Column(
                children: [
                  Image.asset(
                    ImageEnum.logo.imagePath,
                    height: 46,
                  ),
                  Text(
                    '1996 - 2023',
                    style: CustomTextStyle.whiteButtonTextStyle
                        .copyWith(color: ColorConstants.textColor2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
