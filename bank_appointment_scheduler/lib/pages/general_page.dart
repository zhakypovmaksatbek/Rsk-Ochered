import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/constants/color_constants.dart';
import 'package:bank_appointment_scheduler/constants/image_icon_path.dart';
import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:bank_appointment_scheduler/pages/create_ticket.dart';
import 'package:bank_appointment_scheduler/pages/info.dart';
import 'package:bank_appointment_scheduler/pages/home_page.dart';
import 'package:bank_appointment_scheduler/provider/register_provider.dart';
import 'package:bank_appointment_scheduler/service/api_service.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/style/paddigs_and_decaration.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> with BackgroundDecoration {
  Locale selectedLanguage = const Locale("ky", "KG");
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Consumer<RegisterProvider>(
        builder: (context, provider, child) => DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Image.asset(
                ImageEnum.applogo.imagePath,
                height: 30,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      ApiService().fetchUserDetails(ApiService.authToken ?? "");

                      NavigatorManager.instance
                          .pushToPage(NavigateRoutes.profile);
                    },
                    icon: CircleAvatar(
                      backgroundImage: AssetImage(ImageEnum.profile.imagePath),
                    )),
                IntrinsicWidth(
                  child: DropdownButton<Locale>(
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: ColorConstants.white,
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(12),
                    style: TextStyle(color: ColorConstants.white),
                    underline: const SizedBox(),
                    isExpanded: true,
                    value: selectedLanguage,
                    alignment: Alignment.center,
                    dropdownColor: Colors.black38,
                    items: const [
                      DropdownMenuItem<Locale>(
                        value: Locale('ky', 'KG'),
                        child: Text("KG"),
                      ),
                      DropdownMenuItem<Locale>(
                        value: Locale('en', 'EN'),
                        child: Text("EN"),
                      ),
                      DropdownMenuItem<Locale>(
                        value: Locale('ru', 'RU'),
                        child: Text("RU"),
                      ),
                    ],
                    onChanged: (Locale? newValue) {
                      if (newValue != null) {
                        setState(() {});
                        context.setLocale(newValue);
                      }
                    },
                  ),
                )
              ],
            ),
            extendBody: true,
            body: Column(
              children: [
                TabBar(
                  labelColor: ColorConstants.white,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.w400),
                  unselectedLabelColor: ColorConstants.backgroundExpansionTile,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  indicator: const BoxDecoration(color: Colors.transparent),
                  // labelPadding: EdgeInsets.zero,
                  // padding: EdgeInsets.zero,
                  tabs: [
                    Tab(text: LocaleKeys.home.tr()),
                    Tab(text: LocaleKeys.onas.tr()),
                    Tab(text: LocaleKeys.online_bron.tr()),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    dragStartBehavior: DragStartBehavior.down,
                    children: [
                      HomePage(),
                      InfoPage(),
                      const CreateTicket(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 8),
      child: ConvexAppBar(
          onTap: (index) {
            context.read<RegisterProvider>().animateToPage(index);
          },
          curve: Curves.easeInExpo,
          backgroundColor: ColorConstants.white,
          activeColor: ColorConstants.appBarBackgroundColor,
          color: ColorConstants.appBarBackgroundColor,
          disableDefaultTabController: true,
          initialActiveIndex: 1,
          style: TabStyle.reactCircle,
          height: 55,
          items: [
            TabItem(
                activeIcon: CircleAvatar(
                  child: Image.asset(
                    IconEnum.onas.iconPath,
                    height: 30,
                    color: ColorConstants.white,
                  ),
                ),
                icon: Image.asset(
                  IconEnum.onas.iconPath,
                  height: 30,
                  color: ColorConstants.appBarBackgroundColor,
                ),
                title: LocaleKeys.onas.tr()),
            TabItem(
                activeIcon: CircleAvatar(
                  child: Image.asset(
                    IconEnum.home.iconPath,
                    color: ColorConstants.white,
                    height: 30,
                  ),
                ),
                icon: Image.asset(
                  IconEnum.home.iconPath,
                  color: ColorConstants.appBarBackgroundColor,
                  height: 30,
                ),
                title: LocaleKeys.home.tr()),
            TabItem(
                activeIcon: CircleAvatar(
                  child: Image.asset(
                    IconEnum.ochered.iconPath,
                    color: ColorConstants.white,
                    height: 30,
                  ),
                ),
                icon: Image.asset(
                  IconEnum.ochered.iconPath,
                  color: ColorConstants.appBarBackgroundColor,
                  height: 30,
                ),
                title: LocaleKeys.ochered.tr()),
          ]),
    );
  }
}
