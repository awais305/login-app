import 'package:flutter/material.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/utils/constants.dart';

import '../../../components/network_image_component.dart';
import '../../../theme_data/fonts.dart';

class ProfileHeader extends StatelessWidget {
  final Data user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AssetImages.particles),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  NetworkImageComponent(url: user.avatar, size: 120),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      AssetImages.edit,
                      width: 30,
                    ),
                  )
                ],
              ),
              SizedBox.shrink(),
              Column(
                children: [
                  Text(
                    user.fullName,
                    style: CustomFontStyle.boldText.copyWith(fontSize: 24),
                  ),
                  Text(
                    user.email,
                    style: CustomFontStyle.boldText
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
