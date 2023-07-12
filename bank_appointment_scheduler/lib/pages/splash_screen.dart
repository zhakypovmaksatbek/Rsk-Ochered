import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/constants/image_icon_path.dart';
import 'package:bank_appointment_scheduler/pages/login/register_page.dart';
import 'package:bank_appointment_scheduler/theme/style/paddigs_and_decaration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Product/navigator/navigator_manager.dart';
import '../Product/navigator/navigator_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BackgroundDecoration {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        NavigatorManager.instance
            .pushTopageReplacementNamed(NavigateRoutes.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageEnum.logo2.imagePath,
              height: MediaQuery.of(context).size.height * .2,
              color: Colors.white,
            ),
          ),
          const CustomSizedBox(),
          SpinKitFadingCircle(
            color: ColorConstants.white,
          ),
        ],
      ),
    );
  }
}
