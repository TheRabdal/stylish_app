import 'package:stylish_app/packages/packages.dart';

class CheckoutOptionCard extends StatelessWidget {
  final CheckoutMethodModel method;
  final VoidCallback onTap;
  final bool isSelected;

  const CheckoutOptionCard({
    super.key,
    required this.method,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFFF83758) : Colors.transparent,
            width: 1.5,
          ),
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
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
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
