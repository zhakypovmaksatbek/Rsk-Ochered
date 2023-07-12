import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/model/transaction_model.dart';
import 'package:bank_appointment_scheduler/provider/ticket_id.dart';
import 'package:bank_appointment_scheduler/service/transaction_service.dart';
import 'package:bank_appointment_scheduler/theme/style/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class GetTransaction extends StatefulWidget {
  const GetTransaction({Key? key}) : super(key: key);

  @override
  State<GetTransaction> createState() => _GetRegionState();
}

class _GetRegionState extends State<GetTransaction> with BackgroundDecoration {
  TransactionModel? selectedRegion;
  @override
  void initState() {
    TransactionService().getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TransactionModel>>(
      future: TransactionService().getTransactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: SpinKitFadingCircle(
            color: ColorConstants.white,
          ));
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final transactions = snapshot.data!;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.backgroundExpansionTile,
            ),
            child: DropdownButton<TransactionModel>(
              padding: horizontalPaddingMedium,
              value: selectedRegion,
              isExpanded: true,
              hint: Text(
                LocaleKeys.operation.tr(),
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
              items: transactions.map((transaction) {
                return DropdownMenuItem<TransactionModel>(
                  value: transaction,
                  onTap: () {
                    context.read<TickedID>().transactionId = transaction.id;
                 
                  },
                  child: Text(
                    transaction.title ?? '',
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
