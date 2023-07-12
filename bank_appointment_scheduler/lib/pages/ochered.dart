import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/constants/image_icon_path.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/provider/ticket_id.dart';
import 'package:bank_appointment_scheduler/service/api_service.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:bank_appointment_scheduler/widget/get_area.dart';
import 'package:bank_appointment_scheduler/widget/get_city.dart';
import 'package:bank_appointment_scheduler/widget/get_department.dart';
import 'package:bank_appointment_scheduler/widget/get_region.dart';
import 'package:bank_appointment_scheduler/widget/get_transaction.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Product/model/ticket_model.dart';
import '../constants/color_constants.dart';
import '../constants/text_constants.dart';
import '../data/my_data.dart';
import '../model/ticket_model.dart';
import '../provider/category_provider.dart';
import '../theme/style/my_custom_textstyle.dart';
import 'login/register_page.dart';

class Ochered extends StatelessWidget with BackgroundDecoration {
  Ochered({super.key});

  final MyData myData = MyData();
  final String formattedDate = DateFormat('dd MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final CategoryProvider provider = context.watch<CategoryProvider>();
    final List<String> oblast = provider.oblList.keys.toList();
    String formattedTime =
        '${provider.defaultTime.hour.toString().padLeft(2, '0')}:${provider.defaultTime.minute.toString().padLeft(2, '0')}';
    String dateTimeNow = DateFormat('HH:mm').format(DateTime.now());

    final idProvider = context.read<TickedID>();
    TicketModels ticketModel = TicketModels(
      owner: ApiService.authToken,
      date: '2023-07-09',
      time: '16:00:00',
      status: true,
      activationCode: 'string',
      number: 'string',
      executant: 0,
      region: idProvider.regionId,
      area: idProvider.areaId,
      category: 1,
      city: idProvider.cityId,
      department: idProvider.departmentId,
      transaction: idProvider.transactionId,
    );
    void sendTicket() async {
      try {
        Dio dio = Dio();
        Response response = await dio.post(
          'https://petshackaton.ru/ticket/create_ticket/',
          options: Options(
            headers: {
              'accept': ApiService.authToken,
              'Content-Type':
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4ODk3NzcyNiwiaWF0IjoxNjg4ODkxMzI2LCJqdGkiOiI0MzdjNjFhNjRhMWE0MDY0OTI2ZGFjOTQzZjBhMGNjYyIsInVzZXJfaWQiOjMxfQ.udczXsM0dhzmrDaQNJR2ieuaSmUPduLao7CutoMEvE8',
            },
          ),
          data: ticketModel.toJson(),
        );

        if (response.statusCode == 200) {
          print("Succes");
          // Başarılı bir şekilde veri gönderildi
        } else {
          // Hata durumu
        }
      } catch (error) {
        // İstek sırasında bir hata oluştu
        print('Hata: $error');
      }
    }

    return Container(
      decoration: decoration,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: horizontalPaddingNormal,
          child: ListView(
            children: [
              Image.asset(
                ImageEnum.logo2.imagePath,
                height: MediaQuery.of(context).size.height * .1,
              ),
              const CustomSizedBox(),
              const GetRegion(),
              const CustomSizedBox(),
              const GetCity(),
              const CustomSizedBox(),
              const GetArea(),
              const CustomSizedBox(),
              const GetDepartment(),
              const CustomSizedBox(),
              const GetTransaction(),

              const CustomSizedBox(),
              //Select Date Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      provider.selectDate(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .08,
                      width: MediaQuery.of(context).size.width * .4,
                      padding: paddingNormal,
                      decoration: containerDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.selectedDate != ''
                                ? provider.selectedDate
                                : formattedDate,
                            style: CustomTextStyle.expansionTextStyle,
                          ),
                          Icon(
                            Icons.calendar_month_outlined,
                            color: ColorConstants.textColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      provider.selectedTimePicker(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .08,
                      width: MediaQuery.of(context).size.width * .42,
                      padding: paddingNormal,
                      decoration: containerDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.defaultTime != ''
                                ? formattedTime
                                : dateTimeNow,
                            style: CustomTextStyle.expansionTextStyle,
                          ),
                          Icon(
                            Icons.access_time,
                            color: ColorConstants.textColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        sendTicket();
                       
                        if (provider.selectedObl != 'oblast'.tr() &&
                            provider.selectedRayon != 'rayon'.tr() &&
                            provider.selectedCity != 'city'.tr() &&
                            provider.selectedAddress != 'filial'.tr() &&
                            provider.selectedOperation != 'operation'.tr()) {
                          TicketModel task = TicketModel(
                            selectedDate: provider.selectedDate,
                            selectedTime: formattedTime,
                            selectedOblast: provider.selectedObl,
                            selectedRayon: provider.selectedRayon,
                            selectedCity: provider.selectedCity,
                            selectedAddress: provider.selectedAddress,
                            selectedOperation: provider.selectedOperation,
                            selectedCategories:
                                provider.getSelectedCategories(),
                          );
                          int index = provider.ticket.indexOf(task);
                          provider.ticket.add(task);

                          NavigatorManager.instance.pushTopageReplacementNamed(
                              NavigateRoutes.ticketDetail,
                              arguments: provider
                                  .getTicketDetailsRouteArguments(index, task));
                          provider.selectedObl = 'oblast'.tr();
                          provider.selectedRayon = 'rayon'.tr();
                          provider.selectedCity = 'city'.tr();
                          provider.selectedAddress = 'filial'.tr();
                          provider.selectedOperation = 'operation'.tr();
                        } else {
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(TextConstants.notEnoughInfo),
                                content: Text(
                                    TextConstants.selectAddressAndOperation),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(LocaleKeys.ok.tr()),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        TextConstants.createTicket,
                        style: CustomTextStyle.buttonTextStyle,
                      ))),
              const CustomSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}



        // Select Operation
              // ExpansionTile(
              //   title: Text(
              //     provider.selectedOperation,
              //     style: CustomTextStyle.expansionTextStyle,
              //   ),
              //   children: [
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * .2,
              //       child: ListView.builder(
              //         itemCount: provider.getSelectedCategories().length,
              //         itemBuilder: (context, index) {
              //           final district =
              //               provider.getSelectedCategories()[index];

              //           return TextButton(
              //             style: const ButtonStyle(
              //               alignment: FractionalOffset.centerLeft,
              //             ),
              //             onPressed: () {
              //               provider.changeSelectedCtgry(district);
              //             },
              //             child: Text(
              //               district,
              //               style: CustomTextStyle.expansionTextStyle,
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),