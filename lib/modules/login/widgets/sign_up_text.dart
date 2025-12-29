import 'package:stylish_app/packages/packages.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("Create An Account "),
        Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
