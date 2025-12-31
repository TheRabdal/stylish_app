import 'package:stylish_app/packages/packages.dart';

class ResetPasswordInstruction extends StatelessWidget {
  const ResetPasswordInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "* ",
        style: GoogleFonts.montserrat(
          color: const Color(0xFFF83758),
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text:
                "We will send you a message to set or reset \nyour new password",
            style: GoogleFonts.montserrat(
              color: const Color(0xFF676767),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
