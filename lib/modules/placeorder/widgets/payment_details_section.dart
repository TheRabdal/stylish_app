import 'package:flutter/material.dart';
import '../models/place_order_model.dart';

class PaymentDetailsSection extends StatelessWidget {
  final PaymentDetailsModel details;

  const PaymentDetailsSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Order Payment Details",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildRow(
          "Order Amounts",
          "₹ ${details.orderAmounts.toStringAsFixed(2)}",
          isBoldValue: true,
        ),
        const SizedBox(height: 12),
        _buildRow(
          "Convenience",
          "Apply Coupon",
          valueColor: Colors.pinkAccent,
          labelSuffix: const Text(
            "  Know More",
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildRow("Delivery Fee", "Free", valueColor: Colors.pinkAccent),
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Order Total",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Text(
              "₹ ${details.orderTotal.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            text: "EMI Available  ",
            style: TextStyle(fontSize: 14, color: Colors.black54),
            children: [
              TextSpan(
                text: "Details",
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    bool isBoldValue = false,
    Color? valueColor,
    Widget? labelSuffix,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            if (labelSuffix != null) labelSuffix,
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBoldValue ? FontWeight.w600 : FontWeight.w500,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
