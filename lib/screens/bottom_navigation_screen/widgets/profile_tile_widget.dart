import 'package:flutter/material.dart';
import 'package:login_app/utils/constants.dart';
import 'package:login_app/theme_data/fonts.dart';

class ProfileTileWidget extends StatelessWidget {
  final String iconPath;
  final String text;
  final Function() onTap;

  const ProfileTileWidget(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFEEEEEE),
            ),
          ),
        ),
        child: Row(
          spacing: 16,
          children: [
            Image.asset(iconPath, width: 24, color: Colors.black),
            Text(text,
                style: CustomFontStyle.regularText
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
            Spacer(),
            Image.asset(AssetImages.rightArrow, width: 24),
          ],
        ),
      ),
    );
  }
}
