import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/text_constants.dart';
import '../../pages/login/register_page.dart';
import '../../theme/style/my_custom_textstyle.dart';
import '../../theme/style/paddigs_and_decaration.dart';
import '../buttons/outline_navigation_button.dart';

class LocationFilialCard extends StatelessWidget with BackgroundDecoration {
  const LocationFilialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPaddingMedium,
      child: Container(
        decoration: containerDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 40,
                    color: ColorConstants.appBarBackgroundColor,
                  ),
                  Text(
                    "Точки обслуживания",
                    style: CustomTextStyle.labelTextStyle,
                  ),
                ],
              ),
              const CustomSizedBox(),
              Text(
                TextConstants.descriptionCard,
                style: CustomTextStyle.expansionTextStyle,
              ),
              const CustomSizedBox(),
              const OutlineNavigateButton(
                title: "Все регионы",
              ),
              const CustomSizedBox(),
              const OutlineNavigateButton(title: "Выберите тип точки"),
              const CustomSizedBox(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      NavigatorManager.instance
                          .pushToPage(NavigateRoutes.branches);
                    },
                    child: const Text("Показать")),
              ),
              const CustomSizedBox(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.filial.tr(),
                        style: CustomTextStyle.underLineTextStyle.copyWith(
                            color: ColorConstants.appBarBackgroundColor,
                            decorationColor:
                                ColorConstants.appBarBackgroundColor),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Банкоматы",
                        style: CustomTextStyle.underLineTextStyle.copyWith(
                            color: ColorConstants.appBarBackgroundColor,
                            decorationColor:
                                ColorConstants.appBarBackgroundColor),
                      )),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Карта банкоматов и отделений",
                    style: CustomTextStyle.underLineTextStyle.copyWith(
                        color: ColorConstants.appBarBackgroundColor,
                        decorationColor: ColorConstants.appBarBackgroundColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
