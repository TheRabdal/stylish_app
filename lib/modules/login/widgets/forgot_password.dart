import "package:stylish_app/packages/packages.dart";

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, ResetPasswordPage.route);
        },
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
            color: Color(0xFFF83758),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
