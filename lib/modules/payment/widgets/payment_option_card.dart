import 'package:stylish_app/packages/packages.dart';

class PaymentOptionCard extends StatelessWidget {
  final PaymentMethodModel method;
  final VoidCallback onTap;

  const PaymentOptionCard({
    super.key,
    required this.method,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  method.fallbackIcon,
                  size: 24,
                  color: method.id == 'VISA'
                      ? Colors.blue.shade900
                      : Colors.black,
                ),
                const SizedBox(width: 16),
                Text(
                  method.name,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              method.accountNumber,
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
