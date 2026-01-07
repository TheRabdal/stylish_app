import 'package:stylish_app/packages/packages.dart';

class SplashPage extends StatefulWidget {
  static const route = 'SplashPage';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await SharedPreference.isLoggedIn();
    final hasSeenOnboarding = await SharedPreference.hasSeenOnboarding();
    final hasSeenGetStarted = await SharedPreference.hasSeenGetStarted();

    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(
        context,
        hasSeenGetStarted ? NavigationPage.route : GetStartedPage.route,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        hasSeenOnboarding ? LoginPage.route : OnboardingPage.route,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logostylish.png'),
      ),
    );
  }
}
