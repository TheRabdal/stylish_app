import 'package:stylish_app/packages/packages.dart';

class AgreementText extends StatelessWidget {
  const AgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
        children: [
          const TextSpan(text: "By clicking the "),
          TextSpan(
            text: "Register",
            style: GoogleFonts.montserrat(color: const Color(0xFFF83758)),
          ),
          const TextSpan(text: " button, you agree to the public offer"),
        ],
      ),
    );
  }
}
