import 'package:flutter/material.dart';
import '../models/shipping_model.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodModel method;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.method,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(8),
          border: method.isSelected
              ? Border.all(color: const Color(0xFFF95B5B), width: 1.5)
              : Border.all(color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Placeholder for Payment Logo
                method.iconData != null
                    ? Icon(method.iconData, size: 24, color: Colors.indigo)
                    : const Icon(Icons.credit_card, size: 24),
                // Ideally use Switch case on name to show specific assets if available
                if (method.name.toLowerCase().contains('visa'))
                  const SizedBox(width: 8) // Placeholder padding
                else
                  const SizedBox(width: 12),

                if (method.name.toLowerCase().contains('visa'))
                  const Text(
                    "VISA",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Color(0xFF1A1F71),
                    ),
                  )
                else if (method.name.toLowerCase().contains('paypal'))
                  const Text(
                    "PayPal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF003087),
                    ),
                  )
                else if (method.name.toLowerCase().contains('maestro'))
                  const Icon(Icons.circle, color: Colors.blue) // Dummy logo
                else if (method.name.toLowerCase().contains('apple'))
                  const Icon(Icons.apple, size: 24),
              ],
            ),
            Text(
              "*********${method.maskedNumber}",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
