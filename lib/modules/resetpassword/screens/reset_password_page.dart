import 'package:stylish_app/packages/packages.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  static const String route = 'ResetPasswordPage';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();

      final isRegistered = await SharedPreference.isUserRegistered();
      if (!isRegistered) {
        _showErrorDialog('Email tidak terdaftar');
        return;
      }

      final savedEmail = await SharedPreference.getUserEmail();
      if (savedEmail != email) {
        _showErrorDialog('Email tidak terdaftar');
        return;
      }

      if (!mounted) return;
      _showResetPasswordDialog(email);
    }
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

  void _showResetPasswordDialog(String email) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password Baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Konfirmasi Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              final newPassword = newPasswordController.text;
              final confirmPassword = confirmPasswordController.text;

              if (newPassword.isEmpty || confirmPassword.isEmpty) {
                Navigator.pop(context);
                _showErrorDialog('Password tidak boleh kosong');
                return;
              }

              if (newPassword.length < 6) {
                Navigator.pop(context);
                _showErrorDialog('Password minimal 6 karakter');
                return;
              }

              if (newPassword != confirmPassword) {
                Navigator.pop(context);
                _showErrorDialog('Password tidak sama');
                return;
              }

              final success = await SharedPreference.updatePassword(
                email,
                newPassword,
              );
              Navigator.pop(context);

              if (success) {
                _showSuccessDialog('Password berhasil diubah!');
              } else {
                _showErrorDialog('Gagal mengubah password');
              }
            },
            child: const Text('Reset'),
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
              Navigator.pop(context);
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const ResetPasswordHeader(),
                const SizedBox(height: 40),
                CustomTextField(
                  hint: "Enter your email address",
                  icon: Icons.email_sharp,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const ResetPasswordInstruction(),
                const SizedBox(height: 40),
                Button(
                  text: "Submit",
                  onPressed: _onSubmit,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
