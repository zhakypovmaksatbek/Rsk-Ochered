// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank_appointment_scheduler/Product/model/ticket_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../generated/locale_keys.g.dart';
import '../provider/category_provider.dart';
import '../theme/style/paddigs_and_decaration.dart';
import '../widget/my_tickets_widgets.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({
    Key? key,
    required this.index,
    required this.ticket,
  }) : super(key: key);
  final TicketModel ticket;
  final int index;

  @override
  State<TicketDetailsPage> createState() => _InfoTicketState();
}

class _InfoTicketState extends State<TicketDetailsPage>
    with BackgroundDecoration {
  bool isDelete = false;
  void changeDelete() {
    isDelete = !isDelete;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<CategoryProvider>(builder: (context, provider, child) {
          return Padding(
            padding: paddingMedium,
            child: isDelete
                ? const Center(
                    child: Text("Deleted your ticket!!!"),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset('assets/images/rsk_logo2.png',
                            height: MediaQuery.of(context).size.height * .1),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .01),
                      Text(
                        LocaleKeys.your_ticket.tr(),
                        style: TextStyle(
                            color: ColorConstants.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),

                      //Код активатции //'Номер талона'
                      const ActivationCode(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      AddressInfo(ticket: widget.ticket),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      OperationInfo(
                          paddingMedium: paddingNormal,
                          containerDecoration: containerDecoration,
                          ticket: widget.ticket),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      DateTimeInfo(
                          paddingMedium: paddingNormal,
                          containerDecoration: containerDecoration,
                          ticket: widget.ticket),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Biletiniz ochurulsunbu?",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Jok')),
                                      ElevatedButton(
                                          onPressed: () {
                                            provider.deleteTicket(widget.index);
                                            changeDelete();
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ooba')),
                                    ],
                                  );
                                },
                              );
                            },
                            child: LinearButton(
                              color: ColorConstants.white,
                              title: 'delete'.tr(),
                              paddingNormal: paddingNormal,
                              linearDecoration: linearDecoration2,
                            ),
                          ),
                          LinearButton(
                            title: 'edit'.tr(),
                            paddingNormal: paddingNormal,
                            linearDecoration: linearDecoration,
                          )
                        ],
                      ),
                    ],
                  ),
          );
        }),
      ),
    );
  }
}
