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
  bool suffix = true;
  String? _emailError;
  String? _passwordError;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final isRegistered = await SharedPreference.isUserRegistered();
    if (!isRegistered) {
      setState(
        () => _emailError =
            'Akun belum terdaftar. Silakan daftar terlebih dahulu',
      );
      return;
    }

    final isValid = await SharedPreference.validateUser(email, password);
    if (!isValid) {
      setState(() {
        _emailError = 'Email salah';
        _passwordError = 'Password salah';
      });
      return;
    }

    final payload = LoginPayload(email: email, password: password);
    debugPrint("Login with: ${payload.email}, ${payload.password}");

    await SharedPreference.setLoggedIn(true);

    if (!mounted) return;
    Navigator.pushNamed(context, GetStartedPage.route);
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const LoginHeader(),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!_isValidEmail(value)) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                    hint: "Username or Email",
                    icon: Icons.person,
                    controller: _emailController,
                    fontWeight: FontWeight.w500,
                  ),
                  if (_emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _emailError!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                    hint: "Password",
                    icon: Icons.lock,
                    isPassword: true,
                    passwordHash: suffix,
                    controller: _passwordController,
                    fontWeight: FontWeight.w500,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          suffix = !suffix;
                        });
                      },
                      child: Icon(
                        suffix ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  if (_passwordError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _passwordError!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  const ForgotPassword(),
                  const SizedBox(height: 50),
                  Button(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _onLogin();
                      }
                    },
                    fontWeight: FontWeight.w600,
                  ),
                  const SocialLogin(),
                  const SizedBox(height: 40),
                  const SignUpText(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
