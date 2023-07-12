// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank_appointment_scheduler/theme/style/index.dart';
import 'package:flutter/material.dart';

import 'package:bank_appointment_scheduler/pages/login/register_page.dart';

import '../widget/cards/info_card_with_image.dart';
import '../widget/cards/info_phone_number_card.dart';
import '../widget/cards/location_filial_card.dart';
import '../widget/cards/valyut_card.dart';

class HomePage extends StatelessWidget with BackgroundDecoration {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 700,
        child: ListView(
          children: [
            const InfoCardWidgetWithImage(),
            ValyutCard(),
            const CustomSizedBox(),
            const LocationFilialCard(),
            const CustomSizedBox(),
            InfoPhoneNumberCard(paddingMedium: paddingMedium)
          ],
        ),
      ),
    );
  }
}
