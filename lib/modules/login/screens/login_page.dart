import 'package:stylish_app/packages/packages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String route = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool suffix = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    final payload = LoginPayload(
      email: _emailController.text,
      password: _passwordController.text,
    );
    debugPrint("Login with: ${payload.email}, ${payload.password}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const LoginHeader(),
              CustomTextField(
                hint: "Username or Email",
                icon: Icons.person,
                controller: _emailController,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
                passwordHash: suffix,
                controller: _passwordController,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      suffix = !suffix;
                    });
                  },
                  child: Icon(suffix ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 10),
              const ForgotPassword(),
              const SizedBox(height: 50),
              Button(text: 'Login', onPressed: _onLogin),
              const SocialLogin(),
              const SizedBox(height: 40),
              const SignUpText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
