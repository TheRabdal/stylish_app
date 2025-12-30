import 'package:flutter/material.dart';
import '../models/shipping_model.dart';

class OrderSummarySection extends StatelessWidget {
  final ShippingSummaryModel summary;

  const OrderSummarySection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRow("Order", summary.orderAmount),
        const SizedBox(height: 12),
        _buildRow("Shipping", summary.shippingFee),
        const SizedBox(height: 12),
        _buildRow("Total", summary.totalAmount, isTotal: true),
        const SizedBox(height: 24),
        const Divider(),
      ],
    );
  }

  Widget _buildRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w500 : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey[600],
          ),
        ),
        Text(
          "₹ ${amount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
            color: isTotal ? Colors.black : Colors.black87,
          ),
        ),
      ],
    );
  }
}
