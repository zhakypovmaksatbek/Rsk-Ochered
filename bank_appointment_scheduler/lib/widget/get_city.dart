import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/service/city_service.dart';
import 'package:bank_appointment_scheduler/theme/style/index.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../model/city_model.dart';
import '../provider/ticket_id.dart';

class GetCity extends StatefulWidget {
  const GetCity({Key? key}) : super(key: key);

  @override
  State<GetCity> createState() => _GetTicketState();
}

class _GetTicketState extends State<GetCity> with BackgroundDecoration {
  CityModel? selectedCity;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CityModel>>(
      future: CityService().getCities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SpinKitFadingCircle(
            color: ColorConstants.white,
          ));
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final cities = snapshot.data!;

          return Container(
            decoration: BoxDecoration(
                color: const Color(0xffEEF8FF),
                borderRadius: BorderRadius.circular(12)),
            child: DropdownButton<CityModel>(
              underline: Container(),
              padding: horizontalPaddingMedium,
              elevation: 0,
              isExpanded: true,
              focusColor: Colors.amber,
              value: selectedCity,
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: ColorConstants.iconColor,
              ),
              hint: Text(
                LocaleKeys.city.tr(),
                style: CustomTextStyle.expansionTextStyle,
              ),
              items: cities.map((city) {
                return DropdownMenuItem<CityModel>(
                  value: city,
                   onTap: () {
                    context.read<TickedID>().departmentId = city.id;
                  },
                  child: Text(
                    city.title ?? '',
                    style: CustomTextStyle.expansionTextStyle,
                  ),
                );
              }).toList(),
              onChanged: (selectedCity) {
                setState(() {
                  this.selectedCity = selectedCity;
                });
                // Seçili şehir değiştiğinde yapılacak işlemler
                // selectedCity değişkeni seçilen şehri temsil ediyor
              },
            ),
          );
        } else {
          return const Text('Veri bulunamadı');
        }
      },
    );
  }
}
