import 'package:bank_appointment_scheduler/constants/image_icon_path.dart';
import 'package:bank_appointment_scheduler/pages/info.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:flutter/material.dart';

class InfoDetailPage extends StatelessWidget with BackgroundDecoration {
  const InfoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            ImageEnum.appbar.imagePath,
            height: 24,
          ),
        ),
        body: InfoPage(),
      ),
    );
  }
}
