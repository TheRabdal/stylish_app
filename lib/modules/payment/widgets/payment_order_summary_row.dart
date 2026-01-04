import 'package:stylish_app/packages/packages.dart';

class PaymentOrderSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const PaymentOrderSummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
