import 'package:flutter/material.dart';

import '../../constants/image_icon_path.dart';
import '../../theme/style/my_custom_textstyle.dart';
import '../../theme/style/paddigs_and_decaration.dart';

class OutlineNavigateButton extends StatelessWidget with BackgroundDecoration {
  const OutlineNavigateButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: borderContainerDecoration,
        child: Padding(
          padding: outlinePadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CustomTextStyle.expansionTextStyle,
              ),
              Image.asset(
                IconEnum.navigate.iconPath,
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
