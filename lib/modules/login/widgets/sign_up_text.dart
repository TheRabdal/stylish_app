import 'package:stylish_app/packages/packages.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Create An Account ",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to Sign Up
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFF83758), // Pink
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
