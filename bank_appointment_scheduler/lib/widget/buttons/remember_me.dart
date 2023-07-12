import 'package:bank_appointment_scheduler/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../provider/register_provider.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RegisterProvider provider = context.watch<RegisterProvider>();
    return CheckboxListTile(
      tileColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: provider.isChecked ? true : false,
      title: Text(
        LocaleKeys.remember_me.tr(),
        style: TextStyle(color: ColorConstants.textButtonColor),
      ),
      onChanged: (value) {
        provider.changeChecked();
      },
    );
  }
}
