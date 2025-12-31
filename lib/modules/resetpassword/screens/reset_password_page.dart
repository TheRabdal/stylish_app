import 'package:stylish_app/packages/packages.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  static const String route = 'ResetPasswordPage';

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    // Implement password reset logic
    debugPrint("Reset password for: ${_emailController.text}");
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
    );
  }
}
