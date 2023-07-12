// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bank_appointment_scheduler/provider/category_provider.dart';
import 'package:bank_appointment_scheduler/theme/style/my_custom_textstyle.dart';

import '../theme/style/paddigs_and_decaration.dart';

class SelectedAddressExpTile extends StatelessWidget {
  const SelectedAddressExpTile({
    super.key,
    required this.provider,
  });

  final CategoryProvider provider;

  @override
  Widget build(BuildContext context) {
    final List<String> addressKeys = provider.address.keys.toList();

    return ExpansionTile(
      title: Text(
        provider.selectedAddress,
        style: CustomTextStyle.expansionTextStyle,
      ),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
            itemCount: addressKeys.length,
            itemBuilder: (context, index) {
              return TextButton(
                style: const ButtonStyle(
                  alignment: FractionalOffset.centerLeft,
                ),
                onPressed: () {
                  provider.changeSelectedAddress(addressKeys[index]);
                  final String selectedKey = addressKeys[index];
                  provider.selectedAddressFilial =
                      provider.address[selectedKey]!;
                },
                child: Text(
                  addressKeys[index],
                  style: CustomTextStyle.expansionTextStyle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SelectedCityExpTile extends StatelessWidget {
  const SelectedCityExpTile({
    super.key,
    required this.provider,
  });

  final CategoryProvider provider;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(provider.selectedCity,
          style: CustomTextStyle.expansionTextStyle),
      children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: const ButtonStyle(
              alignment: FractionalOffset.centerLeft,
            ),
            onPressed: () {
              provider.changeSelectedBishkek(provider.bishkek);
            },
            child: Text(
              provider.bishkek,
              style: CustomTextStyle.expansionTextStyle,
            ),
          ),
        )
      ],
    );
  }
}

class SelectedRayonExpTile extends StatelessWidget {
  const SelectedRayonExpTile({
    super.key,
    required this.provider,
  });

  final CategoryProvider provider;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        context.watch<CategoryProvider>().selectedRayon,
        style: CustomTextStyle.expansionTextStyle,
      ),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
            itemCount: provider.getSelectedDistricts().length,
            itemBuilder: (context, index) {
              final district = provider.getSelectedDistricts()[index];
              return TextButton(
                style: const ButtonStyle(
                  alignment: FractionalOffset.centerLeft,
                ),
                onPressed: () {
                  provider.changeSelectedRyn(district);
                },
                child: Text(
                  district,
                  style: CustomTextStyle.expansionTextStyle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SelectedOblastExpTile extends StatelessWidget {
  const SelectedOblastExpTile({
    super.key,
    required this.provider,
    required this.oblast,
  });

  final CategoryProvider provider;
  final List<String> oblast;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        provider.selectedObl,
        style: CustomTextStyle.expansionTextStyle,
      ),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
            itemCount: oblast.length,
            itemBuilder: (context, index) {
              return TextButton(
                style: const ButtonStyle(
                  alignment: FractionalOffset.centerLeft,
                ),
                onPressed: () {
                  provider.updateRegions(oblast[index]);
                },
                child: Text(
                  oblast[index],
                  style: CustomTextStyle.expansionTextStyle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CategoryExpansion extends StatelessWidget with BackgroundDecoration {
  const CategoryExpansion({
    Key? key,
    required this.categoryName,
    required this.itemCount,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String categoryName;

  final int itemCount;
  final List<String> title;
  final void Function(String titles) onTap;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        categoryName,
        style: CustomTextStyle.expansionTextStyle,
      ),
      childrenPadding: horizontalPaddingNormal,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                final titles = title[index];
                return TextButton(
                  style:
                      const ButtonStyle(alignment: FractionalOffset.centerLeft),
                  onPressed: () {
                    onTap(titles);
                  },
                  child: Text(
                    titles,
                    style: CustomTextStyle.expansionTextStyle,
                  ),
                );
              }),
        )
      ],
    );
  }
}
