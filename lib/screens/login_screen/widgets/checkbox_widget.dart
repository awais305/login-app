import 'package:flutter/material.dart';
import 'package:login_app/theme_data/palette.dart';

import '../../../theme_data/fonts.dart';

class CheckboxWidget extends StatelessWidget {
  final String text;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  const CheckboxWidget(
      {super.key,
      required this.text,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox.adaptive(
          value: value,
          checkColor: Colors.white,
          activeColor: Palette.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          side: BorderSide(color: Palette.primary, width: 1.5),
          onChanged: onChanged,
        ),
        Text(
          text,
          style:
              CustomFontStyle.lightText.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
