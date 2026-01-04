import 'package:stylish_app/packages/packages.dart';

class PaymentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PaymentButton({
    super.key,
    required this.onPressed,
    this.text = "Continue",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xFFF83758),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
