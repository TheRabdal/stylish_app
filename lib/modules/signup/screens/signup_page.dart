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
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _onSignUp() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
      _confirmPasswordError = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    final isRegistered = await SharedPreference.isUserRegistered();
    if (isRegistered) {
      final savedEmail = await SharedPreference.getUserEmail();
      setState(
        () => _emailError = 'Akun dengan email $savedEmail sudah terdaftar',
      );
      return;
    }

    await SharedPreference.registerUser(email, password);
    await SharedPreference.setLoggedIn(true);

    if (!mounted) return;
    Navigator.pushNamed(context, GetStartedPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SignupHeader(),
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
                  passwordHash: !_passwordVisible,
                  controller: _passwordController,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
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
                const SizedBox(height: 30),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password tidak boleh kosong';
                    } else if (value != _passwordController.text) {
                      return 'Password dan konfirmasi password tidak sama';
                    }
                    return null;
                  },
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
                if (_confirmPasswordError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _confirmPasswordError!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                const AgreementText(),
                const SizedBox(height: 40),
                Button(
                  text: 'Create Account',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _onSignUp();
                    }
                  },
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
      ),
    );
  }
}
