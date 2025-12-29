import 'package:flutter/material.dart';
import 'package:stylish_app/modules/modules.dart';

final Map<String, WidgetBuilder> appRoutes = {
  SplashPage.route: (context) => const SplashPage(),
  OnboardingPage.route: (context) => const OnboardingPage(),
  LoginPage.route: (context) => const LoginPage(),
  SignUpPage.route: (context) => const SignUpPage(),
  ResetPasswordPage.route: (context) => const ResetPasswordPage(),
  GetStartedPage.route: (context) => const GetStartedPage(),
  HomePage.route: (context) => const HomePage(),
};
