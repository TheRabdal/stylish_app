import 'package:stylish_app/packages/packages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String route = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: const [
              LoginHeader(),
              LoginForm(),
              LoginButton(),
              SocialLogin(),
              Spacer(),
              SignupText(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
