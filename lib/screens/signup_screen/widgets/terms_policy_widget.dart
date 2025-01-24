import 'package:flutter/material.dart';
import 'package:login_app/theme_data/fonts.dart';

import '../../../theme_data/palette.dart';

class TermsPolicyWidget extends StatelessWidget {
  const TermsPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: 'By continuing you agree to our ',
            style: CustomFontStyle.regularText.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Palette.lightGrey),
          ),
          TextSpan(
            text: 'Terms of Service',
            style: CustomFontStyle.regularText.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF704B8D)),
          ),
          TextSpan(
            text: ' and ',
            style: CustomFontStyle.regularText.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Palette.lightGrey),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: CustomFontStyle.regularText.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Palette.purple),
          ),
        ],
      ),
    );
  }
}
