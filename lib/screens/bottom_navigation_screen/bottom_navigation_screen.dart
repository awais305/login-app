import 'package:flutter/material.dart';
import 'package:login_app/utils/constants.dart';
import 'package:login_app/theme_data/palette.dart';

import 'earnings_nav.dart';
import 'home_nav.dart';
import 'jobs_nav.dart';
import 'profile_nav.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeNav(),
    JobsNav(),
    EarningsNav(),
    ProfileNav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: icon(AssetImages.work, _currentIndex == 1),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: icon(AssetImages.wallet, _currentIndex == 2),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: icon(AssetImages.profile, _currentIndex == 3),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget icon(String iconPath, bool isActive) {
    return Image.asset(iconPath,
        height: 24, color: isActive ? Palette.primary : Palette.lightGrey);
  }
}
