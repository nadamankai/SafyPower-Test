import 'package:fintech_dashboard_clone/layout/app_layout.dart';
import 'package:fintech_dashboard_clone/screen/Login_Screen.dart';
import 'package:fintech_dashboard_clone/screen/Signup_screen.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/expense_income_chart.dart';
import 'package:fintech_dashboard_clone/state/StationState.dart';
import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/statistics.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/last_users_map.dart';
import 'package:fintech_dashboard_clone/screen/profile_screen.dart';
import 'package:fintech_dashboard_clone/screen/statistique_screen.dart';
import 'package:fintech_dashboard_clone/screen/contact_us_screen.dart';
import 'package:fintech_dashboard_clone/screen/ForgotPwd.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StationsStates(),
      child: const FintechDasboardApp(),
    ),
  );
}

class FintechDasboardApp extends StatelessWidget {
  const FintechDasboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        scrollbarTheme: Styles.scrollbarTheme,
      ),
      home: const LoginScreen(),
    );
  }
}
