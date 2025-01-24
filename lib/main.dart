import 'package:flutter/material.dart';
import 'package:login_app/providers/user_provider.dart';
import 'package:login_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'theme_data/theme_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      home: const SplashScreen(),
    );
  }
}
