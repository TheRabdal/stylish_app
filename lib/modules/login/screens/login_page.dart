import 'package:stylish_app/packages/packages.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String route = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: const [
              LoginHeader(),
              CustomTextField(hint: "Username or Email", icon: Icons.person),
              SizedBox(height: 30),
              CustomTextField(
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
              ),
              SizedBox(height: 10),
              ForgotPassword(),
              SizedBox(height: 50),
              LoginButton(),
              SocialLogin(),
              SizedBox(height: 40),
              SignUpText(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
