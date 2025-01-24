import 'package:flutter/material.dart';

import '../../../components/network_image_component.dart';
import '../../../models/user_model.dart';
import '../../../theme_data/fonts.dart';

class AppbarHeadingWidget extends StatelessWidget {
  final Data? user;

  const AppbarHeadingWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!',
              style: CustomFontStyle.boldText.copyWith(color: Colors.white),
            ),
            Text(
              user?.fullName ?? '-',
              style: CustomFontStyle.boldText
                  .copyWith(color: Colors.white, fontSize: 24, height: 0.5),
            ),
          ],
        ),
        NetworkImageComponent(
          url: user?.avatar ?? '',
        ),
      ],
    );
  }
}
