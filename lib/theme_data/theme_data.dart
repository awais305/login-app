import 'package:flutter/material.dart';

import 'fonts.dart';
import 'palette.dart';

ThemeData themeData() => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary),
      useMaterial3: true,
      fontFamily: 'Urbanist',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Palette.primary,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Palette.primary,
        unselectedItemColor: Color(0xFF9e9e9e),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerHeight: 0,
        unselectedLabelColor: Palette.primary,
        labelStyle: CustomFontStyle.boldText.copyWith(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
        unselectedLabelStyle: CustomFontStyle.boldText.copyWith(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Palette.primary),
        labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
    );
