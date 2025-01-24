import 'package:flutter/material.dart';
import 'package:login_app/theme_data/fonts.dart';

import 'tabs/consumer_tab.dart';
import 'tabs/service_provider_tab.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Account',
          style: CustomFontStyle.boldText.copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Container(
            height: 53,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.25),
                  offset: const Offset(0, 1),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              controller: tabController,
              tabs: [
                Tab(text: 'Consumer'),
                Tab(text: 'Service Provider'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                ConsumerTab(),
                ServiceProviderTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
