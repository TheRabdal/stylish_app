import 'package:stylish_app/packages/packages.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "I Already Have an Account ",
          style: GoogleFonts.montserrat(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Login",
            style: GoogleFonts.montserrat(
              color: const Color(0xFFF83758),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFFF83758),
            ),
          ),
        ),
      ],
    );
  }
}
