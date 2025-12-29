import 'package:stylish_app/packages/packages.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 40),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Create an\naccount",
          style: GoogleFonts.montserrat(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
