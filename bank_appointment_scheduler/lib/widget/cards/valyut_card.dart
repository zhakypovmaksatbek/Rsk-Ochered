import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:flutter/material.dart';

import '../../constants/image_icon_path.dart';
import '../../pages/login/register_page.dart';
import '../../theme/style/my_custom_textstyle.dart';

class ValyutCard extends StatelessWidget with BackgroundDecoration {
  ValyutCard({
    super.key,
  });

  final Map<String, List<String>> valyuta = {
    'USD': ['87.30', '88.30'],
    'EUR': ['94.00', '95.00'],
    'RUB': ['1.05', '1.08'],
    'KZT': ['0.1300', '0.250']
  };
  final List<String> title = [
    'Валюта',
    'покупка',
    'продажа',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPaddingMedium,
      child: Container(
        decoration: containerDecoration,
        child: Padding(
          padding: cardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    IconEnum.money.iconPath,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text("Курсы валют",
                        style: CustomTextStyle.labelTextStyle),
                  ),
                ],
              ),
              const CustomSizedBox(),
              Text(
                "по г.Бишкек с понедельника по пятницу",
                style:
                    CustomTextStyle.expansionTextStyle.copyWith(fontSize: 14),
              ),
              const CustomSizedBox(),
              Text(
                "Курс на 12.06.2023",
                style: CustomTextStyle.expansionTextStyle.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title[0],
                          style: const TextStyle(
                              color: ColorConstants.appBarBackgroundColor),
                        ),
                        Text(
                          title[1],
                          style: const TextStyle(
                              color: ColorConstants.appBarBackgroundColor),
                        ),
                        Text(
                          title[2],
                          style: const TextStyle(
                              color: ColorConstants.appBarBackgroundColor),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: valyuta.length,
                  itemBuilder: (context, index) {
                    final valyut = valyuta.keys.toList()[index];
                    final valyutValues = valyuta[valyut];

                    return Container(
                      color: index.isEven
                          ? ColorConstants.appBarBackgroundColor
                          : ColorConstants.backgroundExpansionTile,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valyut,
                            style: TextStyle(
                              color: index.isOdd
                                  ? ColorConstants.appBarBackgroundColor
                                  : ColorConstants.backgroundExpansionTile,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            valyutValues![0],
                            style: TextStyle(
                              color: index.isOdd
                                  ? ColorConstants.appBarBackgroundColor
                                  : ColorConstants.backgroundExpansionTile,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            valyutValues[1],
                            style: TextStyle(
                              color: index.isOdd
                                  ? ColorConstants.appBarBackgroundColor
                                  : ColorConstants.backgroundExpansionTile,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const CustomSizedBox(),
              const SizedBox(
                child: Text(
                  'При конвертации валюты эквивалентом более 1 000 долларов США действуют договорные обменные курсы.',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
