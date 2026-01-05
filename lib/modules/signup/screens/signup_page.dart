import 'package:stylish_app/packages/packages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String route = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUp() {
    debugPrint("Sign up with: ${_emailController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignupHeader(),
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
                passwordHash: !_passwordVisible,
                controller: _passwordController,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                hint: "Confirm Password",
                icon: Icons.lock,
                isPassword: true,
                passwordHash: !_confirmPasswordVisible,
                controller: _confirmPasswordController,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    _confirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const AgreementText(),
              const SizedBox(height: 40),
              Button(
                text: 'Create Account',
                onPressed: _onSignUp,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 40),
              const SocialSignup(),
              const SizedBox(height: 25),
              const LoginText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
