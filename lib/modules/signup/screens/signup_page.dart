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

  void _onSignUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty) {
      _showErrorDialog('Email tidak boleh kosong');
      return;
    }

    if (!_isValidEmail(email)) {
      _showErrorDialog('Format email tidak valid');
      return;
    }

    if (password.isEmpty) {
      _showErrorDialog('Password tidak boleh kosong');
      return;
    }

    if (password.length < 6) {
      _showErrorDialog('Password minimal 6 karakter');
      return;
    }

    if (confirmPassword.isEmpty) {
      _showErrorDialog('Konfirmasi password tidak boleh kosong');
      return;
    }

    if (password != confirmPassword) {
      _showErrorDialog('Password dan konfirmasi password tidak sama');
      return;
    }

    final isRegistered = await SharedPreference.isUserRegistered();
    if (isRegistered) {
      final savedEmail = await SharedPreference.getUserEmail();
      _showErrorDialog('Akun dengan email $savedEmail sudah terdaftar');
      return;
    }

    await SharedPreference.registerUser(email, password);
    await SharedPreference.setLoggedIn(true);

    if (!mounted) return;

    _showSuccessDialog('Akun berhasil dibuat!');
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sukses'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, GetStartedPage.route);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
