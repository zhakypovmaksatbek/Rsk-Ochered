import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/data/full_address.dart';
import 'package:bank_appointment_scheduler/theme/style/index.dart';
import 'package:flutter/material.dart';

class BranchesPage extends StatefulWidget {
  const BranchesPage({Key? key}) : super(key: key);

  @override
  State<BranchesPage> createState() => _BranchesPageState();
}

class _BranchesPageState extends State<BranchesPage> with BackgroundDecoration {
  final List<String> regions = FullAddress.regions.keys.toList();

  int selectedRegionIndex = -1;
  int selectedValue = -1;

  List<String> getSelectedRegionAreas() {
    if (selectedRegionIndex >= 0 && selectedRegionIndex < regions.length) {
      final selectedRegion = regions[selectedRegionIndex];
      final selectedRegionData = FullAddress.regions[selectedRegion]!;
      final areas = selectedRegionData.map((item) => item.keys.first).toList();
      return areas;
    }
    return [];
  }

  Widget buildRegionList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.5,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: regions.length,
        itemBuilder: (BuildContext context, int index) {
          final isSelected = selectedRegionIndex == index;
          return InkWell(
            onTap: () {
              setState(() {
                selectedRegionIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                regions[index],
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                  color: isSelected
                      ? ColorConstants.white
                      : ColorConstants.backgroundExpansionTile,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildAreasList() {
    final areas = getSelectedRegionAreas();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: areas.length,
        itemBuilder: (BuildContext context, int index) {
          return RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: index,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as int;
              });
            },
            title: Text(
              areas[index],
              style: CustomTextStyle.whiteButtonTextStyle,
            ),
            tileColor: Colors.transparent,
            fillColor: MaterialStatePropertyAll(
                ColorConstants.backgroundExpansionTile),
            activeColor: ColorConstants.backgroundButtonColor,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Branches'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRegionList(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: buildAreasList(),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: containerDecoration,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: selectedValue != -1
                      ? ListView.builder(
                          itemCount: FullAddress
                              .regions[regions[selectedRegionIndex]]![
                                  selectedValue]
                              .values
                              .first
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = FullAddress
                                .regions[regions[selectedRegionIndex]]![
                                    selectedValue]
                                .values
                                .first[index];
                            return Padding(
                              padding: horizontalPaddingMedium,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      '${index + 1}. $item',
                                      style: CustomTextStyle.expansionTextStyle,
                                    ),
                                  ),
                                  const Divider(
                                    height: 2,
                                    color: ColorConstants.appBarBackgroundColor,
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
