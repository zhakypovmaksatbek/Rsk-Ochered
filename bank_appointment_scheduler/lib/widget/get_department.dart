import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/model/department_model.dart';
import 'package:bank_appointment_scheduler/provider/ticket_id.dart';
import 'package:bank_appointment_scheduler/theme/style/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../service/department_service.dart';

class GetDepartment extends StatefulWidget {
  const GetDepartment({Key? key}) : super(key: key);

  @override
  State<GetDepartment> createState() => _GetRegionState();
}

class _GetRegionState extends State<GetDepartment> with BackgroundDecoration {
  DepatmentModel? selectedDepartment;
  @override
  void initState() {
    DepartmentService().getDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DepatmentModel>>(
      future: DepartmentService().getDepartment(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SpinKitFadingCircle(
            color: ColorConstants.white,
          ));
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final departments = snapshot.data!;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.backgroundExpansionTile,
            ),
            child: DropdownButton<DepatmentModel>(
              padding: horizontalPaddingMedium,
              value: selectedDepartment,
              isExpanded: true,
              hint: Text(
                LocaleKeys.filial.tr(),
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
                  selectedDepartment = selectedCity;
                });
                // Seçili şehir değiştiğinde yapılacak işlemler
                // selectedCity değişkeni seçilen şehri temsil ediyor
              },
              items: departments.map((department) {
                return DropdownMenuItem<DepatmentModel>(
                  value: department,
                  onTap: () {
                    context.read<TickedID>().departmentId = department.id;
                  },
                  child: Text(
                    department.title ?? '',
                    style: CustomTextStyle.expansionTextStyle,
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          return const Text('Veri bulunamadı');
        }
      },
    );
  }
}
