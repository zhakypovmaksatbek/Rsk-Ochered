// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:bank_appointment_scheduler/Product/navigator/navigator_manager.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/theme/style/my_custom_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/color_constants.dart';
import '../../constants/image_icon_path.dart';
import '../../constants/text_constants.dart';

class InfoCardWidgetWithImage extends StatefulWidget {
  const InfoCardWidgetWithImage({super.key});

  @override
  State<InfoCardWidgetWithImage> createState() =>
      _InfoCardWidgetWithImageState();
}

class _InfoCardWidgetWithImageState extends State<InfoCardWidgetWithImage> {
  final int count = 4;

  int currentPage = 0;
  final PageController _controller = PageController();

  Timer? _timer;

  @override
  void initState() {
    _controller.addListener(_onPageChanged);
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentPage < 4 - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linear,
      );
      _restartTimer();
    });
  }

  void _restartTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      _startTimer();
    });
  }

  void _onPageChanged() {
    setState(() {
      currentPage = _controller.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
            height: 480,
            child: PageView(
                controller: _controller,
                //physics: const PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  ImageCard(
                    image: ImageEnum.ochered.imagePath,
                    label: TextConstants.label,
                    onTap: () {
                      NavigatorManager.instance
                          .pushToPage(NavigateRoutes.infoDetail);
                    },
                  ),
                  ImageCard(
                    image: ImageEnum.banner.imagePath,
                    label: TextConstants.label2,
                    onTap: () {},
                  ),
                  ImageCard(
                    image: ImageEnum.banner3.imagePath,
                    label: 'более 500 платежей и услуг доступны',
                    onTap: () {},
                  ),
                  ImageCard(
                    image: ImageEnum.banner3.imagePath,
                    label: "ОТ РСК БАНК",
                    onTap: () {},
                  ),
                ]),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 15,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: count,
                effect: const JumpingDotEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Color(0xff9FDBFC),
                  dotColor: Color(0xff548DAD),
                ),
              ),
            ),
          )
        ]),
      ],
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 395,
        ),
        Positioned(
          bottom: 80,
          left: 21,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .85,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 50,
            right: 30,
            child: InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    'Подробнее',
                    style: CustomTextStyle.underLineTextStyle,
                  ),
                  Icon(
                    Icons.navigate_next_outlined,
                    color: ColorConstants.white,
                  )
                ],
              ),
            )),
      ],
    );
  }
}
