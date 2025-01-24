import 'package:flutter/material.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/providers/user_provider.dart';
import 'package:login_app/utils/constants.dart';
import 'package:login_app/theme_data/fonts.dart';
import 'package:login_app/theme_data/palette.dart';
import 'package:login_app/utils/view_more.dart';
import 'package:provider/provider.dart';

import 'widgets/profile_header.dart';
import 'widgets/profile_tile_widget.dart';

class ProfileNav extends StatelessWidget {
  const ProfileNav({super.key});

  @override
  Widget build(BuildContext context) {
    Data? user = context.read<UserProvider>().user?.data;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Profile',
                  style: CustomFontStyle.boldText.copyWith(fontSize: 24),
                ),
                Image.asset(AssetImages.menu, width: 28),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox.shrink(),
                    ProfileHeader(user: user!),
                    Row(
                      spacing: 24,
                      children: [
                        _Info(
                          title: 'Earning',
                          number: user.earnings.toString(),
                        ),
                        _Info(
                          title: 'Ratings',
                          number: user.ratings,
                          isRating: true,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me',
                          style:
                              CustomFontStyle.boldText.copyWith(fontSize: 18),
                        ),
                        SizedBox(height: 12),
                        ViewMore(
                          context.read<UserProvider>().user?.data?.bio ?? '',
                          trimLines: 2,
                          style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          moreStyle: CustomFontStyle.boldText.copyWith(
                              color: Palette.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                          lessStyle: CustomFontStyle.boldText.copyWith(
                              color: Palette.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                          trimMode: Trimer.line,
                          trimCollapsedText: ' View more',
                          trimExpandedText: ' View less',
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ProfileTileWidget(
                          iconPath: AssetImages.location,
                          text: 'Business Location',
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          iconPath: AssetImages.work,
                          text: 'Bookings',
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          iconPath: AssetImages.wallet,
                          text: 'My Services',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final String title;
  final String number;
  final bool isRating;

  const _Info(
      {required this.title, required this.number, this.isRating = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(4, 6, 15, 0.05),
              blurRadius: 60,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: CustomFontStyle.lightText.copyWith(
                  fontWeight: FontWeight.w600, color: Color(0xFF757575)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isRating) Image.asset(AssetImages.star, width: 20),
                Text(
                  '\$$number',
                  style: CustomFontStyle.boldText
                      .copyWith(fontSize: 18, color: Palette.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
