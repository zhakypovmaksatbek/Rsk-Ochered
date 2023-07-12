import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/model/area_model.dart';
import 'package:bank_appointment_scheduler/provider/ticket_id.dart';
import 'package:bank_appointment_scheduler/service/area_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../theme/style/my_custom_textstyle.dart';
import '../theme/style/paddigs_and_decaration.dart';

class GetArea extends StatefulWidget {
  const GetArea({Key? key}) : super(key: key);

  @override
  State<GetArea> createState() => _GetTicketState();
}

class _GetTicketState extends State<GetArea> with BackgroundDecoration {
  AreaModel? selectedArea;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AreaModel>>(
      future: AreaService().getAreas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SpinKitFadingCircle(
            color: ColorConstants.white,
          ));
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final areas = snapshot.data!;
          return Container(
            decoration: BoxDecoration(
                color: const Color(0xffEEF8FF),
                borderRadius: BorderRadius.circular(12)),
            child: DropdownButton<AreaModel>(
              underline: Container(),
              padding: horizontalPaddingMedium,
              elevation: 0,
              isExpanded: true,
              focusColor: Colors.amber,
              value: selectedArea,
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: ColorConstants.iconColor,
              ),
              hint: Text(
                LocaleKeys.rayon.tr(),
                style: CustomTextStyle.expansionTextStyle,
              ),
              items: areas.map((area) {
                return DropdownMenuItem<AreaModel>(
                  value: area,
                  onTap: () {
                    context.read<TickedID>().areaId = area.id;
                  },
                  child: Text(
                    area.title ?? '',
                    style: CustomTextStyle.expansionTextStyle,
                  ),
                );
              }).toList(),
              onChanged: (selectedArea) {
                setState(() {
                  this.selectedArea = selectedArea;
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
