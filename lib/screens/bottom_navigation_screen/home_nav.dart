import 'package:flutter/material.dart';
import 'package:login_app/components/button_component.dart';
import 'package:login_app/providers/user_provider.dart';
import 'package:login_app/utils/constants.dart';
import 'package:login_app/theme_data/fonts.dart';
import 'package:login_app/theme_data/palette.dart';
import 'package:provider/provider.dart';

import 'widgets/appbar_card_widget.dart';
import 'widgets/appbar_heading_widget.dart';
import 'widgets/avatars_widget.dart';

class HomeNav extends StatelessWidget {
  HomeNav({super.key});

  final _avatars = [
    AssetImages.avatar1,
    AssetImages.avatar2,
    AssetImages.avatar3,
    AssetImages.avatar4,
    AssetImages.avatar5,
    AssetImages.avatar6,
    AssetImages.avatar7,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                35, MediaQuery.paddingOf(context).top + 10, 35, 35),
            decoration: BoxDecoration(
              color: Palette.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            child: Column(
              spacing: 20,
              children: [
                AppbarHeadingWidget(
                    user: context.read<UserProvider>().user?.data),
                AppbarCardWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarsWidget(avatars: _avatars),
                Text(
                  'Invite your friends and get big discounts',
                  style: CustomFontStyle.boldText,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Invite  your other friends to our platform to get plenty of discounts waiting for you!',
                  style: CustomFontStyle.regularText,
                  textAlign: TextAlign.center,
                ),
                SizedBox.shrink(),
                ButtonComponent(
                  height: 45,
                  maxWidth: 244,
                  borderRadius: 5,
                  text: 'Copy Referral link',
                  iconPath: AssetImages.copy,
                  onPressed: () {
                    //
                  },
                ),
                Text('Send To',
                    style: CustomFontStyle.boldText.copyWith(fontSize: 15)),
                ButtonComponent(
                  height: 45,
                  maxWidth: 244,
                  borderRadius: 5,
                  isBorderedButton: true,
                  text: 'Send Referral Link',
                  iconPath: AssetImages.send,
                  onPressed: () {
                    //
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
