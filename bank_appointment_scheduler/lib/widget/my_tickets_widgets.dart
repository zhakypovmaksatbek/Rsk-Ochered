// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bank_appointment_scheduler/Product/model/ticket_model.dart';
import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/provider/category_provider.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:bank_appointment_scheduler/theme/style/my_custom_textstyle.dart';

class LinearButton extends StatelessWidget {
  const LinearButton({
    Key? key,
    required this.paddingNormal,
    required this.linearDecoration,
    required this.title,
    this.color,
  }) : super(key: key);

  final EdgeInsets paddingNormal;
  final BoxDecoration linearDecoration;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
      padding: paddingNormal,
      decoration: linearDecoration,
      child: Center(
        child: Text(
          title,
          style: CustomTextStyle.expansionTextStyle
              .copyWith(color: color, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class DateTimeInfo extends StatelessWidget {
  const DateTimeInfo({
    super.key,
    required this.paddingMedium,
    required this.containerDecoration,
    required this.ticket,
  });

  final EdgeInsets paddingMedium;
  final BoxDecoration containerDecoration;
  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.date_and_time.tr(),
            style: CustomTextStyle.expansionTextStyle
                .copyWith(color: ColorConstants.backgroundExpansionTile)),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        Row(
          children: [
            Container(
              padding: paddingMedium,
              decoration: containerDecoration,
              child: Text(ticket.selectedDate,
                  style: CustomTextStyle.expansionTextStyle
                      .copyWith(fontSize: 18)),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * .1),
            Container(
              padding: paddingMedium,
              decoration: containerDecoration,
              child: Text(ticket.selectedTime,
                  style: CustomTextStyle.expansionTextStyle
                      .copyWith(fontSize: 18)),
            )
          ],
        ),
      ],
    );
  }
}

class OperationInfo extends StatelessWidget {
  const OperationInfo({
    super.key,
    required this.paddingMedium,
    required this.containerDecoration,
    required this.ticket,
  });

  final EdgeInsets paddingMedium;
  final BoxDecoration containerDecoration;
  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('uslugi',
                style: CustomTextStyle.expansionTextStyle
                    .copyWith(color: ColorConstants.backgroundExpansionTile))
            .tr(),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        Container(
          width: double.infinity,
          padding: paddingMedium,
          decoration: containerDecoration,
          child: Text(
            ticket.selectedOperation,
            style: CustomTextStyle.expansionTextStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.ticket,
  });

  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('filial',
                style: CustomTextStyle.expansionTextStyle
                    .copyWith(color: ColorConstants.backgroundExpansionTile))
            .tr(),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
        ListTile(
          title: Text(ticket.selectedAddress),
          subtitle: Text(
            context.watch<CategoryProvider>().selectedAddressFilial,
            style: CustomTextStyle.expansionTextStyle,
          ),
          trailing: const Icon(
            Icons.location_on_outlined,
            size: 40,
          ),
        )
      ],
    );
  }
}

class ActivationCode extends StatelessWidget {
  const ActivationCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoContainer(
          title: 'code_activ'.tr(),
          number: '02321',
        ),
        const QRCode(),
        InfoContainer(
          title: 'talon_num'.tr(),
          number: '02321',
        ),
      ],
    );
  }
}

class InfoContainer extends StatelessWidget with BackgroundDecoration {
  final String number;
  final String title;
  const InfoContainer({
    Key? key,
    required this.number,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration,
      child: Padding(
        padding: paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: CustomTextStyle.expansionTextStyle
                  .copyWith(color: ColorConstants.textColor, fontSize: 12),
            ),
            Text(
              number,
              style: CustomTextStyle.expansionTextStyle
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class QRCode extends StatelessWidget with BackgroundDecoration {
  const QRCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: containerDecoration,
        child: Padding(
          padding: paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'scanner'.tr(),
                style: CustomTextStyle.expansionTextStyle
                    .copyWith(color: ColorConstants.textColor, fontSize: 12),
              ),
              const Icon(
                Icons.qr_code_scanner_outlined,
                color: ColorConstants.appBarBackgroundColor,
                size: 38,
              )
            ],
          ),
        ),
      ),
    );
  }
}
