import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/constants/text_constants.dart';
import 'package:flutter/material.dart';


import '../theme/style/paddigs_and_decaration.dart';

class InfoPage extends StatelessWidget with BackgroundDecoration {
  InfoPage({super.key});
  final String path = 'assets/images/rsk_logo3.png';

  List<String> getParagraphs() {
    return TextConstants.oNas.split("\n");
  }

  @override
  Widget build(BuildContext context) {
    List<String> paragraphs = getParagraphs();
    return Padding(
        padding: paddingNormal,
        child: ListView(
          children: [
            Image.asset(path),
            SizedBox(height: MediaQuery.of(context).size.height*.02),
            ...paragraphs.map((paragraph) {
              if (paragraph.startsWith(RegExp(r"\d+\."))) {
                // Numaralandırılmış bölümse, başına numara ekleyerek oluşturulan bir widget döndürün
                String number = paragraph.split(".")[0];
                String content =
                    paragraph.substring(paragraph.indexOf(" ") + 1);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$number.',
                      style: TextStyle(color: ColorConstants.white),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Text(content,
                            style: TextStyle(color: ColorConstants.white))),
                  ],
                );
              } else {
                // Diğer paragraflar için sadece bir Text widget'ı döndürün
                return Text(paragraph,
                    style: TextStyle(color: ColorConstants.white));
              }
            }).toList(),
          ],
        ));
  }
}
