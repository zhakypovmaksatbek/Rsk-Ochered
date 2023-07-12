import 'package:flutter/material.dart';

import '../../theme/style/my_custom_textstyle.dart';
import '../../theme/style/paddigs_and_decaration.dart';
  
class CustomElevatedButton extends StatelessWidget with BackgroundDecoration {
  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: linearDecoration,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Center(
              child: Text(
            title,
            style: CustomTextStyle.buttonTextStyle,
          )),
        ),
      ),
    );
  }
}

