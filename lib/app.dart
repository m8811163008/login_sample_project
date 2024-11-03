import 'package:flutter/material.dart';
import 'package:login_sample_project/features/home/home_screen.dart';
import 'package:login_sample_project/features/login/login_screen_phone_input.dart';
import 'package:login_sample_project/features/login/login_screen_verify.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.loginRoutePhoneInput: (context) => const LoginScreenPhoneInput(),
        Routes.loginRouteVerify: (context) => const LoginScreenVerify(),
        Routes.homeRoute: (context) => const HomeScreen(),
      },
    );
  }
}

class Routes {
  static String loginRoutePhoneInput = '/';

  static String loginRouteVerify = 'verify-phone-number';

  static String homeRoute = 'home-route';
}
