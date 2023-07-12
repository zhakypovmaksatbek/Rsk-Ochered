import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/provider/ticket_id.dart';
import 'package:bank_appointment_scheduler/theme/style/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../model/region_model.dart';
import '../service/region_service.dart';

class GetRegion extends StatefulWidget {
  const GetRegion({Key? key}) : super(key: key);

  @override
  State<GetRegion> createState() => _GetRegionState();
}

class _GetRegionState extends State<GetRegion> with BackgroundDecoration {
  RegionModel? selectedRegion;
  @override
  void initState() {
    RegionService().getRegions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RegionModel>>(
      future: RegionService().getRegions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SpinKitFadingCircle(
            color: ColorConstants.white,
          ));
        } else if (snapshot.hasError) {
          return Text('Kata: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final regions = snapshot.data!;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.backgroundExpansionTile,
            ),
            child: DropdownButton<RegionModel>(
              padding: horizontalPaddingMedium,
              value: selectedRegion,
              isExpanded: true,
              hint: Text(
                LocaleKeys.oblast.tr(),
                style:
                    CustomTextStyle.expansionTextStyle.copyWith(fontSize: 14),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: ColorConstants.iconColor,
              ),
              iconSize: 24,
              elevation: 16,
              underline: const SizedBox(),
              onChanged: (selectedCity) {
                setState(() {
                  selectedRegion = selectedCity;
                });
                // Seçili şehir değiştiğinde yapılacak işlemler
                // selectedCity değişkeni seçilen şehri temsil ediyor
              },
              items: regions.map((region) {
                return DropdownMenuItem<RegionModel>(
                  value: region,
                  onTap: () {
                    context.read<TickedID>().regionId = region.id;
                  },
                  child: Text(
                    region.title ?? '',
                    style: CustomTextStyle.expansionTextStyle,
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          return const Text('Do not fount data');
        }
      },
    );
  }
}
