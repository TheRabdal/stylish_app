import 'package:stylish_app/packages/packages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route: (context) => const SplashPage(),
        OnboardingPage.route: (context) => const OnboardingPage(),
        LoginPage.route: (context) => const LoginPage(),
        ResetPasswordPage.route: (context) => const ResetPasswordPage(),
      },
    );
  }
}
