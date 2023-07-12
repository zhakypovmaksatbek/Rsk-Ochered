// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/provider/category_provider.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';

import '../widget/buttons/elevated_button.dart';

class CreateTicket extends StatelessWidget with BackgroundDecoration {
  const CreateTicket({
    Key? key,
  }) : super(key: key);
  final String _path = 'assets/images/rsk_logo2.png';

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CategoryProvider>();
    final List<String> category = provider.categoryModel.keys.toList();

    return Scaffold(
      body: Padding(
        padding: horizontalPaddingHigh,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _path,
              height: MediaQuery.of(context).size.height * .2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: CustomElevatedButton(
                        onTap: () {
                          provider.updateOperation(category[index]);
                          NavigatorManager.instance
                              .pushToPage(NavigateRoutes.ochered);
                        },
                        title: category[index],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
