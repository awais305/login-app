import 'package:flutter/material.dart';

class AvatarsWidget extends StatelessWidget {
  final List<String> avatars;

  const AvatarsWidget({super.key, required this.avatars});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(avatars[0], width: 35),
              Image.asset(avatars[1], width: 35),
              Image.asset(avatars[2], width: 35),
              Image.asset(avatars[3], width: 35),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 10,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(avatars[4], width: 50),
                Image.asset(avatars[5], width: 50),
                Image.asset(avatars[6], width: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
