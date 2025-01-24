import 'package:flutter/material.dart';
import 'package:login_app/theme_data/fonts.dart';

import '../../../utils/constants.dart';

class SocialButtonsWidget extends StatelessWidget {
  const SocialButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                ),
              ),
              Text(
                "Or continue with",
                style: CustomFontStyle.regularText.copyWith(
                    color: Color(0xFF616161),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ],
          ),
        ),
        Row(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButtonWidget(
              iconPath: AssetImages.facebook,
              onTap: () {},
            ),
            _SocialButtonWidget(
              iconPath: AssetImages.google,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class _SocialButtonWidget extends StatelessWidget {
  final String iconPath;
  final Function() onTap;

  const _SocialButtonWidget({required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 60,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 24,
          ),
        ),
      ),
    );
  }
}
