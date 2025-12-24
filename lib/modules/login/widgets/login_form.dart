import 'package:stylish_app/packages/packages.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomTextField(
          hint: "Username or Email",
          icon: Icons.person,
        ),
        SizedBox(height: 20),
        CustomTextField(
          hint: "Password",
          icon: Icons.lock,
          isPassword: true,
        ),
        ForgotPassword(),
        SizedBox(height: 10),
      ],
    );
  }
}
